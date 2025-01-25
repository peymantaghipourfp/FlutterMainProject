
import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

class RegisterModel {
  final int id;
  final String token;

  RegisterModel({
    required this.id,
    required this.token,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    id: json["id"],
    token: json["token"],
  );
}
