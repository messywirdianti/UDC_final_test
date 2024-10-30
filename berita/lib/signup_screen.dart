import 'dart:developer';

import 'package:berita/login_screen.dart';
import 'package:berita/response/res_get_register.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'network.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController fullname = TextEditingController();
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  bool isRegister = false;

  String? validateEmail(String? value) {
    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regExp = RegExp(pattern);

    if (value == null || value.isEmpty) {
      return 'Email tidak boleh kosong';
    } else if (!regExp.hasMatch(value)) {
      return 'Format email tidak valid';
    }
    return null;
  }

  Future<ResGetRegister?> registerUser() async {
    if (!keyForm.currentState!.validate()) {
      return null;
    }

    setState(() {
      isRegister = true;
    });

    try {
      http.Response res = await http.post(
        Uri.parse('${baseUrl}register.php'),
        body: {
          'username': username.text,
          'fullname': fullname.text,
          'email': email.text,
          'password': password.text,
        },
      );
      ResGetRegister data = resGetRegisterFromJson(res.body);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(data.message ?? ''),
          backgroundColor: data.value == 1 ? Colors.green : Colors.red,
        ),
      );

      if (data.value == 1) {
        setState(() {
          isRegister = false;
        });
        // Berhasil registrasi, pindah ke halaman login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      } else {
        setState(() {
          isRegister = false;
        });
      }
    } catch (e, st) {
      setState(() {
        isRegister = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
        ),
      );
      log('st ${st.toString()}');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 70,),
              Image.asset(
                'assets/logo.png',
                width: 150,
                height: 150,
              ),
              const SizedBox(height: 20),
              const Text(
                'Login your Account',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 20),
              Form(
                key: keyForm,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (val) {
                        return val!.isEmpty ? "Password tidak boleh kosong" : null;
                      },
                      controller: fullname,
                      decoration: InputDecoration(
                          hintText: 'Fullname',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      validator: (val) {
                        return val!.isEmpty ? "Username tidak boleh kosong" : null;
                      },
                      controller: username,
                      decoration: InputDecoration(
                          hintText: 'Username',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)
                      ),
                    ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      validator: (val) {
                        return val!.isEmpty ? "Password tidak boleh kosong" : null;
                      },
                      controller: email,
                      decoration: InputDecoration(
                          hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)
                      )
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      validator: (val) {
                        return val!.isEmpty ? "Password tidak boleh kosong" : null;
                      },
                      obscureText: true,
                      controller: password,
                      decoration: InputDecoration(
                          hintText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)
                        ),
                      ),
                      ),

                  ],
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: isRegister
                    ? null
                    : () async {
                  await registerUser();
                },
                child: Text('Sign Up',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                  ),
                  backgroundColor: Color(0xFF1A237E),
                ),
              ),
              const SizedBox(height: 30),
              const SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don’t have an account?', style: TextStyle(fontSize: 18)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                          color: Color(0xFF1A237E),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
