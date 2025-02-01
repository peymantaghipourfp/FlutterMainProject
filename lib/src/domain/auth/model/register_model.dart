
import 'dart:convert';
import 'package:get_storage/get_storage.dart';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));
final storage=GetStorage();
class RegisterModel {
  String message;

  RegisterModel({
    required this.message,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    message: json["message"],
  );
}
