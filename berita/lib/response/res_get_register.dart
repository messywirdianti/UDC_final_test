// To parse this JSON data, do
//
//     final resGetRegister = resGetRegisterFromJson(jsonString);

import 'dart:convert';

ResGetRegister resGetRegisterFromJson(String str) => ResGetRegister.fromJson(json.decode(str));

String resGetRegisterToJson(ResGetRegister data) => json.encode(data.toJson());

class ResGetRegister {
  int? value;
  String? message;

  ResGetRegister({
    this.value,
    this.message,
  });

  factory ResGetRegister.fromJson(Map<String, dynamic> json) => ResGetRegister(
    value: json["value"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "message": message,
  };
}
