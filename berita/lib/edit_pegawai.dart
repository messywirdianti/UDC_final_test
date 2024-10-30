import 'package:berita/menu.dart';
import 'package:berita/response/res_get_pegawai.dart';
import 'package:berita/response/res_get_update_pegawai.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'network.dart';

class EditPegawai extends StatefulWidget {
  final DataPegawai? data;
  const EditPegawai(this.data, {super.key});

  @override
  State<EditPegawai> createState() => _EditPegawaiState();
}

class _EditPegawaiState extends State<EditPegawai> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? nama;
  TextEditingController? noHp;
  TextEditingController? email;
  bool isUpdatePegawai = false;

  @override
  void initState() {
    super.initState();
    nama = TextEditingController(text: widget.data?.nama);
    noHp = TextEditingController(text: widget.data?.noHp);
    email = TextEditingController(text: widget.data?.email);
  }

  @override
  void dispose() {
    nama?.dispose();
    noHp?.dispose();
    email?.dispose();
    super.dispose();
  }

  Future<ResGetUpdatePegawai?> updatePegawai() async {
    if (_formKey.currentState!.validate()) {
      try {
        setState(() {
          isUpdatePegawai = true;
        });
        var request = http.MultipartRequest(
          'POST',
          Uri.parse('${baseUrl}updatePegawai.php'),
        )
          ..fields['nama'] = nama?.text ?? ""
          ..fields['no_hp'] = noHp?.text ?? ""
          ..fields['email'] = email?.text ?? ""
          ..fields['id'] = widget.data?.id.toString() ?? "";

        http.StreamedResponse data = await request.send();
        String resString = await data.stream.bytesToString();
        ResGetUpdatePegawai res = resGetUpdatePegawaiFromJson(resString);

        setState(() {
          isUpdatePegawai = false;
        });

        if (res.value == 1) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const MenuScreen()),
                (Route<dynamic> route) => false,
          );
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(res.message ?? ""),
            backgroundColor: Color(0xFF1A237E),
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(res.message ?? ""),
            backgroundColor: Colors.red,
          ));
        }
      } catch (e) {
        setState(() {
          isUpdatePegawai = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Pegawai', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                TextFormField(
                  controller: nama,
                  decoration: InputDecoration(
                    hintText: 'Nama',
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: noHp,
                  decoration: InputDecoration(
                    hintText: 'No Hp',
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'No Hp tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                isUpdatePegawai
                    ? const Center(child: CircularProgressIndicator(color: Color(0xFF1A237E)))
                    : Center(
                  child: MaterialButton(
                    color: Color(0xFF1A237E),
                    minWidth: 150,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    textColor: Colors.white,
                    onPressed: () async {
                      await updatePegawai();
                    },
                    child: const Text('UPDATE', style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
