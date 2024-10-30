import 'dart:developer';
import 'package:berita/response/res_get_berita.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'detail_berita.dart';
import 'network.dart';

class BeritaScreen extends StatefulWidget {
  const BeritaScreen({super.key});

  @override
  State<BeritaScreen> createState() => _BeritaScreenState();
}

class _BeritaScreenState extends State<BeritaScreen> {
  List<DataBerita> listBerita = [];
  List<DataBerita> filterList = [];
  TextEditingController cariBerita = TextEditingController();
  bool isBerita = false, isDelete = false;

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
          filterList = listBerita;
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
    cariBerita.addListener(() {
      performSearch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Berita',
        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
        ),

      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: cariBerita,
              decoration: InputDecoration(
                  hintText: 'Search...',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25)
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          isBerita
              ? const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          )
              : Expanded(
            child: ListView.builder(
              itemCount: filterList.length,
              itemBuilder: (context, index) {
                DataBerita data = filterList[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailBerita(berita: data),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        // Image with larger size
                        Container(
                          width: 120, // Set the desired width
                          height: 120, // Set the desired height
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: NetworkImage('$imageUrl${data.gambarBerita}'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10), // Space between image and text
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${data.judul}',
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              maxLines: 2, // Limit lines for better layout
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }



  void performSearch() {
    String query = cariBerita.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filterList = listBerita;
      } else {
        filterList = listBerita
            .where((berita) =>
        berita.judul?.toLowerCase().contains(query) ?? false)
            .toList();
      }
    });
  }
}

