import 'package:berita/login_screen.dart';
import 'package:berita/prefs.dart';
import 'package:berita/response/res_get_user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'edit_user.dart';
import 'network.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  bool isUser = false;
  List<DataUser> dataUser = [];
  String? idUser;

  Future<void> getUser() async {
    if (idUser == null || idUser!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ID User tidak ditemukan'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      setState(() {
        isUser = true;
      });

      http.Response res = await http.post(
        Uri.parse('${baseUrl}getUser.php'),
        body: {'id': idUser},
      );

      if (res.statusCode == 200) {
        List<DataUser>? data = resGetUserFromJson(res.body).data;
        setState(() {
          isUser = false;
          dataUser = data ?? [];
        });
      } else {
        setState(() {
          isUser = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Gagal mendapatkan data: ${res.statusCode}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      setState(() {
        isUser = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Terjadi kesalahan: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    prefs.getPref().then((_) {
      setState(() {
        idUser = prefs.idUser;
      });
      getUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profil User',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            const SizedBox(
              height: 100,
            ),
            isUser
                ? const Center(child: CircularProgressIndicator())
                : Center(
                    child: dataUser.isEmpty
                        ? const Text('Tidak ada data user')
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: dataUser.map((e) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        border: Border.all(
                                            width: 5, color: Color(0xFF1A237E))),
                                    child: const CircleAvatar(
                                      radius: 65,
                                      child: Icon(
                                        Icons.person,
                                        size: 85,
                                        color: Color(0xFF1A237E),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Text(
                                    e?.fullname ?? '',
                                    style: const TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    e?.email ?? '',
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 35,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return EditUser(e);
                                          }).then((_) async {
                                        await getUser();
                                      });
                                    },
                                    child: Text(
                                      'Edit Profil',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(double.infinity, 50),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      backgroundColor: Color(0xFF1A237E),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen()));
                                    },
                                    child: Text(
                                      'Log Out',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(double.infinity, 50),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      backgroundColor: Colors.red,
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                  ),
          ]),
        ),
      ),
    );
  }
}
