import 'package:berita/response/res_get_pegawai.dart';
import 'package:flutter/material.dart';

import 'edit_pegawai.dart';

class DetailPegawai extends StatefulWidget {
  final DataPegawai pegawai;
  const DetailPegawai({super.key, required this.pegawai});

  @override
  State<DetailPegawai> createState() => _DetailPegawaiState();
}

class _DetailPegawaiState extends State<DetailPegawai> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Pegawai',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _buildDetailsTable(),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => EditPegawai(widget.pegawai)),
                  );
                },
                child: const Text(
                  'Edit',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  backgroundColor: const Color(0xFF1A237E),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailsTable() {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(0.3),
        1: FlexColumnWidth(0.7),
      },
      children: [
        _buildTableRow('Nama:', widget.pegawai.nama ?? 'Nama Tidak Tersedia'),
        _buildTableRow('No Bp:', widget.pegawai.noBp ?? 'No Bp Tidak Tersedia'),
        _buildTableRow('No Hp:', widget.pegawai.noHp ?? 'No Hp Tidak Tersedia'),
        _buildTableRow('Email:', widget.pegawai.email ?? 'Email Tidak Tersedia'),
      ],
    );
  }

  TableRow _buildTableRow(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
