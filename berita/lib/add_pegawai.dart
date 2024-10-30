import 'package:berita/response/res_get_register.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'network.dart';

class AddPegawai extends StatefulWidget {
  const AddPegawai({super.key});

  @override
  State<AddPegawai> createState() => _AddPegawaiState();
}

class _AddPegawaiState extends State<AddPegawai> {
  final TextEditingController nama = TextEditingController();
  final TextEditingController noBp = TextEditingController();
  final TextEditingController noHp = TextEditingController();
  final TextEditingController email = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isAddPegawai = false;

  // Function to check for duplicates in existing data
  Future<bool> checkForDuplicate() async {
    try {
      final response = await http.get(Uri.parse('${baseUrl}getPegawai.php'));

      if (response.statusCode == 200) {
        List<dynamic> existingData = json.decode(response.body);

        for (var data in existingData) {
          if (data['nama'] == nama.text ||
              data['no_bp'] == noBp.text ||
              data['no_hp'] == noHp.text ||
              data['email'] == email.text) {
            return true; // Duplicate found
          }
        }
      }
    } catch (e) {
      print("Error checking duplicates: $e");
    }
    return false;
  }

  Future<ResGetRegister?> addBerita() async {
    if (!_formKey.currentState!.validate()) {
      return null; // Stop if form is not valid
    }

    try {
      setState(() {
        isAddPegawai = true;
      });

      var request = http.MultipartRequest('POST', Uri.parse('${baseUrl}addPegawai.php'))
        ..fields['nama'] = nama.text
        ..fields['no_bp'] = noBp.text
        ..fields['no_hp'] = noHp.text
        ..fields['email'] = email.text;

      http.StreamedResponse data = await request.send();
      String resString = await data.stream.bytesToString();
      ResGetRegister res = resGetRegisterFromJson(resString);

      setState(() {
        isAddPegawai = false;
      });

      if (res.value == 1) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(res.message ?? ''),
          backgroundColor: Color(0xFF1A237E),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(res.message ?? ''),
          backgroundColor: Colors.red,
        ));
      }
    } catch (e) {
      setState(() {
        isAddPegawai = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        backgroundColor: Colors.red,
      ));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Pegawai'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),
              _buildTextField(nama, 'Nama'),
              const SizedBox(height: 10),
              _buildTextField(noBp, 'No Bp'),
              const SizedBox(height: 10),
              _buildTextField(noHp, 'No Hp'),
              const SizedBox(height: 10),
              _buildTextField(email, 'Email'),
              const SizedBox(height: 20),
              Center(
                child: isAddPegawai
                    ? const CircularProgressIndicator(color: Color(0xFF1A237E))
                    : ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      addBerita();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                      ),
                      backgroundColor: Color(0xFF1A237E)
                  ),
                  child: const Text('Simpan',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$hint tidak boleh kosong';
        }
        return null;
      },
    );
  }
}
