// To parse this JSON data, do
//
//     final resGetPegawai = resGetPegawaiFromJson(jsonString);

import 'dart:convert';

ResGetPegawai resGetPegawaiFromJson(String str) => ResGetPegawai.fromJson(json.decode(str));

String resGetPegawaiToJson(ResGetPegawai data) => json.encode(data.toJson());

class ResGetPegawai {
  bool? isSuccess;
  String? message;
  List<DataPegawai>? data;

  ResGetPegawai({
    this.isSuccess,
    this.message,
    this.data,
  });

  factory ResGetPegawai.fromJson(Map<String, dynamic> json) => ResGetPegawai(
    isSuccess: json["isSuccess"],
    message: json["message"],
    data: json["data"] == null ? [] : List<DataPegawai>.from(json["data"]!.map((x) => DataPegawai.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DataPegawai {
  String? id;
  String? nama;
  String? noBp;
  String? noHp;
  String? email;
  DateTime? tglInput;

  DataPegawai({
    this.id,
    this.nama,
    this.noBp,
    this.noHp,
    this.email,
    this.tglInput,
  });

  factory DataPegawai.fromJson(Map<String, dynamic> json) => DataPegawai(
    id: json["id"],
    nama: json["nama"],
    noBp: json["no_bp"],
    noHp: json["no_hp"],
    email: json["email"],
    tglInput: json["tgl_input"] == null ? null : DateTime.parse(json["tgl_input"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama": nama,
    "no_bp": noBp,
    "no_hp": noHp,
    "email": email,
    "tgl_input": "${tglInput!.year.toString().padLeft(4, '0')}-${tglInput!.month.toString().padLeft(2, '0')}-${tglInput!.day.toString().padLeft(2, '0')}",
  };
}
