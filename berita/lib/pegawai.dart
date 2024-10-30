import 'dart:convert';
import 'dart:developer';
import 'package:berita/response/res_get_pegawai.dart';
import 'package:berita/response/res_get_register.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'add_pegawai.dart';
import 'detail_pegawai.dart';
import 'network.dart';

class PegawaiScreen extends StatefulWidget {
  const PegawaiScreen({super.key});

  @override
  State<PegawaiScreen> createState() => _PegawaiScreenState();
}

class _PegawaiScreenState extends State<PegawaiScreen> {
  List<DataPegawai> listPegawai = [];
  List<DataPegawai> filterList = [];
  TextEditingController cariPegawai = TextEditingController();
  bool isPegawai = false, isDelete = false;

  Future<void> getPegawai() async {
    try {
      setState(() {
        isPegawai = true;
      });
      http.Response res = await http.get(Uri.parse('${baseUrl}getPegawai.php'));

      // Cek status code
      if (res.statusCode == 200) {
        log('Response body: ${res.body}');

        if (res.body.isEmpty) {
          throw Exception('Response is empty');
        }

        final responseJson = json.decode(res.body); // Dekode JSON
        if (responseJson['isSuccess']) {
          List<DataPegawai> data = (responseJson['data'] as List)
              .map((pegawai) => DataPegawai.fromJson(pegawai))
              .toList();

          setState(() {
            isPegawai = false;
            listPegawai = data;
            filterList = listPegawai;
          });
        } else {
          throw Exception(responseJson['message']);
        }
      } else {
        throw Exception('Failed to load pegawai, status code: ${res.statusCode}');
      }
    } catch (e) {
      setState(() {
        isPegawai = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error: ${e.toString()}'),
        backgroundColor: Colors.red,
      ));
      log('Error: $e');
    }
  }

  Future<ResGetRegister?> deletePegawai(String id) async {
    try {
      setState(() {
        isDelete = true;
      });
      http.Response res = await http.post(
          Uri.parse('${baseUrl}deletePegawai.php'),
          body: {'id': id});
      ResGetRegister data = resGetRegisterFromJson(res.body);
      if (data.value == 1) {
        setState(() {
          isDelete = false;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(data.message ?? ""),
            backgroundColor: Colors.green,
          ));
        });
      } else {
        setState(() {
          isDelete = false;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(data.message ?? ""),
          ));
        });
      }
    } catch (e, st) {
      setState(() {
        isDelete = false;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.green,
        ));
      });
    }
  }


  @override
  void initState() {
    super.initState();
    getPegawai();
    cariPegawai.addListener(() {
      performSearch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pegawai', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddPegawai()));
          },
          icon: Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: cariPegawai,
              decoration: InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25)
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),

          isPegawai
              ? const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          )
              : Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filterList.length,
              itemBuilder: (context, index) {
                DataPegawai data = filterList[index];
                return ListTile(
                  onLongPress: () async {
                    await deletePegawai(data.id.toString());
                  },
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailPegawai(pegawai: data),
                      ),
                    );
                  },
                  title: Text('${data.nama}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  void performSearch() {
    String query = cariPegawai.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filterList = listPegawai;
      } else {
        filterList = listPegawai
            .where((berita) =>
        berita.nama?.toLowerCase().contains(query) ?? false)
            .toList();
      }
    });
  }

}
