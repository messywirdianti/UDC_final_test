import 'dart:developer';
import 'package:berita/response/res_get_berita.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'network.dart';

class GaleryScreen extends StatefulWidget {
  const GaleryScreen({super.key});

  @override
  State<GaleryScreen> createState() => _GaleryScreenState();
}

class _GaleryScreenState extends State<GaleryScreen> {
  List<DataBerita> listBerita = [];
  bool isBerita = false; //loading

  Future<ResGetBerita?> getBerita() async {
    try {
      setState(() {
        isBerita = true;
      });
      http.Response res = await http.get(Uri.parse('${baseUrl}getBerita.php'));

      log('Response status: ${res.statusCode}');
      log('Response body: ${res.body}');

      if (res.statusCode == 200) {
        List<DataBerita>? data = resGetBeritaFromJson(res.body).data;
        setState(() {
          isBerita = false;
          listBerita = data ?? [];
        });
      } else {
        setState(() {
          isBerita = false;
        });
        throw Exception('Failed to load berita');
      }
    } catch (e, st) {
      setState(() {
        isBerita = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error: ${e.toString()}'),
        backgroundColor: Colors.red,
      ));
      log('st ${st.toString()}');
    }
  }

  @override
  void initState() {
    super.initState();
    getBerita();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galeri', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: isBerita
          ? const Center(
        child: CircularProgressIndicator(
          color: Colors.green,
        ),
      )
          : GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: listBerita.length,
        itemBuilder: (context, index) {
          DataBerita data = listBerita[index];
          return Card(
            child: Image.network(
              '$imageUrl${data.gambarBerita}',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.broken_image),
            ),
          );
        },
      ),
    );
  }
}
