import 'package:get_storage/get_storage.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
final storage=GetStorage();
LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));


class LoginModel {
   String accessToken=storage.read('accessToken');
   String refreshToken=storage.read('refreshToken');
   String message=storage.read('message');

  LoginModel({
    required this.accessToken,
    required this.refreshToken,
    required this.message,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    accessToken: json["accessToken"],
    refreshToken: json["refreshToken"],
    message: json["message"],
  );
}
