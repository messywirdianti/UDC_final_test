import 'package:berita/galery.dart';
import 'package:berita/berita.dart';
import 'package:berita/pegawai.dart';
import 'package:berita/profil.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: [
          const BeritaScreen(),
          GaleryScreen(),
          const PegawaiScreen(),
          const ProfilScreen(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: TabBar(
          labelColor: Color(0xFF1A237E),
          unselectedLabelColor: Colors.grey,
          controller: tabController,
          tabs: const [
            Tab(text: 'Berita', icon: Icon(Icons.home)),
            Tab(text: 'Galery', icon: Icon(Icons.photo)),
            Tab(text: 'Pegawai', icon: Icon(Icons.supervised_user_circle_sharp)),
            Tab(text: 'Profil', icon: Icon(Icons.person)),
          ],
        ),
      ),
    );
  }
}
