// To parse this JSON data, do
//
//     final resGetUpdateUser = resGetUpdateUserFromJson(jsonString);

import 'dart:convert';

ResGetUpdateUser resGetUpdateUserFromJson(String str) => ResGetUpdateUser.fromJson(json.decode(str));

String resGetUpdateUserToJson(ResGetUpdateUser data) => json.encode(data.toJson());

class ResGetUpdateUser {
  bool? isSuccess;
  int? value;
  String? message;
  String? fullname;
  String? id;

  ResGetUpdateUser({
    this.isSuccess,
    this.value,
    this.message,
    this.fullname,
    this.id,
  });

  factory ResGetUpdateUser.fromJson(Map<String, dynamic> json) => ResGetUpdateUser(
    isSuccess: json["is_success"],
    value: json["value"],
    message: json["message"],
    fullname: json["fullname"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "is_success": isSuccess,
    "value": value,
    "message": message,
    "fullname": fullname,
    "id": id,
  };
}
