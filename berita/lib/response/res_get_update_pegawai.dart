// To parse this JSON data, do
//
//     final resGetUpdatePegawai = resGetUpdatePegawaiFromJson(jsonString);

import 'dart:convert';

ResGetUpdatePegawai resGetUpdatePegawaiFromJson(String str) => ResGetUpdatePegawai.fromJson(json.decode(str));

String resGetUpdatePegawaiToJson(ResGetUpdatePegawai data) => json.encode(data.toJson());

class ResGetUpdatePegawai {
  bool? isSuccess;
  int? value;
  String? message;
  String? nama;
  String? noHp;
  String? email;
  int? id;

  ResGetUpdatePegawai({
    this.isSuccess,
    this.value,
    this.message,
    this.nama,
    this.noHp,
    this.email,
    this.id,
  });

  factory ResGetUpdatePegawai.fromJson(Map<String, dynamic> json) => ResGetUpdatePegawai(
    isSuccess: json["is_success"],
    value: json["value"],
    message: json["message"],
    nama: json["nama"],
    noHp: json["no_hp"],
    email: json["email"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "is_success": isSuccess,
    "value": value,
    "message": message,
    "nama": nama,
    "no_hp": noHp,
    "email": email,
    "id": id,
  };
}
