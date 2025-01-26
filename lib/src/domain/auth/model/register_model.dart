
import 'dart:convert';
import 'package:get_storage/get_storage.dart';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));
final storage=GetStorage();
class RegisterModel {
  int id=storage.read('id');
  String token=storage.read('token');

  RegisterModel({
    required this.id,
    required this.token,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    id: json["id"],
    token: json["token"],
  );
}
