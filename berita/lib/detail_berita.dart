import 'package:berita/response/res_get_berita.dart';
import 'package:flutter/material.dart';

import 'network.dart';

class DetailBerita extends StatefulWidget {
  final DataBerita berita;

  const DetailBerita({super.key, required this.berita});

  @override
  State<DetailBerita> createState() => _DetailBeritaState();
}

class _DetailBeritaState extends State<DetailBerita> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.berita.judul ?? 'Judul Tidak Tersedia'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding for overall layout
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Adjust image size
              Center(
                child: Image.network(
                  '$imageUrl${widget.berita.gambarBerita}',
                  fit: BoxFit.cover,
                  width: 300, // Set a specific width
                  height: 200, // Set a specific height
                  errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, size: 100), // Adjust icon size
                ),
              ),
              const SizedBox(height: 20),
              // Use a Column for text details
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tanggal Berita: ${widget.berita.tglBerita ?? 'Tanggal Tidak Tersedia'}',
                    style: const TextStyle(fontWeight: FontWeight.bold), // Bold for emphasis
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Judul: ${widget.berita.judul ?? 'Judul Tidak Tersedia'}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Isi Berita: ${widget.berita.isiBerita ?? 'Isi berita tidak tersedia'}',
                    style: const TextStyle(height: 1.5), // Better line spacing
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
