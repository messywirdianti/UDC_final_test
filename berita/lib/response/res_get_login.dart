// To parse this JSON data, do
//
//     final resGetLogin = resGetLoginFromJson(jsonString);

import 'dart:convert';

ResGetLogin resGetLoginFromJson(String str) => ResGetLogin.fromJson(json.decode(str));

String resGetLoginToJson(ResGetLogin data) => json.encode(data.toJson());

class ResGetLogin {
  int? value;
  String? message;
  String? username;
  String? fullname;
  String? id;

  ResGetLogin({
    this.value,
    this.message,
    this.username,
    this.fullname,
    this.id,
  });

  factory ResGetLogin.fromJson(Map<String, dynamic> json) => ResGetLogin(
    value: json["value"],
    message: json["message"],
    username: json["username"],
    fullname: json["fullname"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "message": message,
    "username": username,
    "fullname": fullname,
    "id": id,
  };
}
