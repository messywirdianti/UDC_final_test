class Gambar {
  final String gambar;

  Gambar({required this.gambar});

  factory Gambar.fromJson(Map<String, dynamic> json) {
    return Gambar(
      gambar: json['gambarBerita'],
    );
  }
}
