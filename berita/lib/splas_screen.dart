import 'package:berita/login_screen.dart';
import 'package:berita/menu.dart';
import 'package:berita/prefs.dart';
import 'package:flutter/material.dart';

class SplasScreen extends StatefulWidget {
  const SplasScreen({super.key});

  @override
  State<SplasScreen> createState() => _SplasScreenState();
}

class _SplasScreenState extends State<SplasScreen> {
  Future cekSession() async {
    await Future.delayed(const Duration(seconds: 3), () async {
      int? val = await Prefs().getPref();
      print('vall $val');
      if (val != null) {
        setState(() {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const MenuScreen()),
                  (Route<dynamic> route) => false
          );
        });
      } else {
        setState(() {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const LoginScreen()),
                  (Route<dynamic> route) => false);
        });
      }
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cekSession();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png',
              width: 300,
              height: 300,
            )
          ],
        ),
      ),
    );
  }
}
