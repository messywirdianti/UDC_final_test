// To parse this JSON data, do
//
//     final resGetBerita = resGetBeritaFromJson(jsonString);

import 'dart:convert';

ResGetBerita resGetBeritaFromJson(String str) => ResGetBerita.fromJson(json.decode(str));

String resGetBeritaToJson(ResGetBerita data) => json.encode(data.toJson());

class ResGetBerita {
  bool? isSuccess;
  String? message;
  List<DataBerita>? data;

  ResGetBerita({
    this.isSuccess,
    this.message,
    this.data,
  });

  factory ResGetBerita.fromJson(Map<String, dynamic> json) => ResGetBerita(
    isSuccess: json["isSuccess"],
    message: json["message"],
    data: json["data"] == null ? [] : List<DataBerita>.from(json["data"]!.map((x) => DataBerita.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DataBerita {
  String? id;
  String? judul;
  String? isiBerita;
  String? gambarBerita;
  DateTime? tglBerita;

  DataBerita({
    this.id,
    this.judul,
    this.isiBerita,
    this.gambarBerita,
    this.tglBerita,
  });

  factory DataBerita.fromJson(Map<String, dynamic> json) => DataBerita(
    id: json["id"],
    judul: json["judul"],
    isiBerita: json["isi_berita"],
    gambarBerita: json["gambar_berita"],
    tglBerita: json["tgl_berita"] == null ? null : DateTime.parse(json["tgl_berita"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "judul": judul,
    "isi_berita": isiBerita,
    "gambar_berita": gambarBerita,
    "tgl_berita": tglBerita?.toIso8601String(),
  };
}
