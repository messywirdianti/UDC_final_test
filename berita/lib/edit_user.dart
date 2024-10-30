import 'package:berita/prefs.dart';
import 'package:berita/response/res_get_update_user.dart';
import 'package:berita/response/res_get_user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'network.dart';

class EditUser extends StatefulWidget {
  final DataUser e;
  const EditUser(this.e, {super.key});

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? fullname;
  String? idUser;

  bool isUpdate = false;

  Future<ResGetUpdateUser?> updateUser() async {
    if (_formKey.currentState!.validate()) {
      try {
        setState(() {
          isUpdate = true;
        });
        http.Response res = await http.post(
          Uri.parse('${baseUrl}updateUser.php'),
          body: {
            'fullname': fullname?.text,
            'id': idUser,
          },
        );
        ResGetUpdateUser? data = resGetUpdateUserFromJson(res.body);
        if (data.isSuccess == true) {
          setState(() {
            isUpdate = false;
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(data.message ?? ''),
              backgroundColor: Color(0xFF1A237E),
            ));
          });
        }
      } catch (e) {
        setState(() {
          isUpdate = false;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(e.toString()),
            backgroundColor: Colors.red,
          ));
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    prefs.getPref().then((_) {
      setState(() {
        idUser = prefs.idUser;
        print('id_user $idUser');
      });
    });
    fullname = TextEditingController(text: widget.e.fullname);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: const Center(
        child: Text(
          'Edit User',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: fullname,
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[100],
                hintText: 'Enter full name',
                contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Full name tidak boleh kosong';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            if (isUpdate)
              const CircularProgressIndicator(color: Color(0xFF1A237E))
            else
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    await updateUser();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1A237E),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
