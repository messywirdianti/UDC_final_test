import 'dart:developer';
import 'package:berita/menu.dart';
import 'package:berita/prefs.dart';
import 'package:berita/response/res_get_login.dart';
import 'package:berita/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'network.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  bool isLogin = false;

  Future<ResGetLogin?> loginUser() async {
    if (!keyForm.currentState!.validate()) {
      return null;
    }

    setState(() {
      isLogin = true;
    });

    try {
      http.Response res = await http.post(
        Uri.parse('${baseUrl}login.php'),
        body: {
          'username': username.text,
          'password': password.text,
        },
      );

      ResGetLogin data = resGetLoginFromJson(res.body);

      if (data.message != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(data.message ?? ''),
            backgroundColor: data.value == 1 ? Color(0xFF1A237E) : Colors.red,
          ),
        );
      }

      if (data.value == 1) {
        setState(() {
          isLogin = false;
          Prefs.savePref(data.value ?? 0, data.id ?? "");
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const MenuScreen()),
                (Route<dynamic> route) => false,
          );
        });
      } else {
        setState(() {
          isLogin = false;
        });
      }
    } catch (e, st) {
      setState(() {
        isLogin = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
      log('Stack Trace: $st');
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
              SizedBox(height: 150,),
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
                onPressed: isLogin
                    ? null
                    : () async {
                  await loginUser();
                },
                child: Text('Sign In',
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
                          context, MaterialPageRoute(builder: (context) => const SignupScreen()));
                    },
                    child: const Text(
                      'Sign Up',
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
