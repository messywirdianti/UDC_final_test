// To parse this JSON data, do
//
//     final resGetUser = resGetUserFromJson(jsonString);

import 'dart:convert';

ResGetUser resGetUserFromJson(String str) => ResGetUser.fromJson(json.decode(str));

String resGetUserToJson(ResGetUser data) => json.encode(data.toJson());

class ResGetUser {
  bool? isSuccess;
  String? message;
  List<DataUser>? data;

  ResGetUser({
    this.isSuccess,
    this.message,
    this.data,
  });

  factory ResGetUser.fromJson(Map<String, dynamic> json) => ResGetUser(
    isSuccess: json["isSuccess"],
    message: json["message"],
    data: json["data"] == null ? [] : List<DataUser>.from(json["data"]!.map((x) => DataUser.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DataUser {
  String? id;
  String? username;
  String? email;
  String? password;
  String? fullname;
  DateTime? tglDaftar;

  DataUser({
    this.id,
    this.username,
    this.email,
    this.password,
    this.fullname,
    this.tglDaftar,
  });

  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    password: json["password"],
    fullname: json["fullname"],
    tglDaftar: json["tgl_daftar"] == null ? null : DateTime.parse(json["tgl_daftar"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "password": password,
    "fullname": fullname,
    "tgl_daftar": tglDaftar?.toIso8601String(),
  };
}
