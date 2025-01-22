import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:main_project/src/config/repository/auth.repository.dart';

class AuthController extends GetxController{
  final AuthRepository _authRepository=AuthRepository();
  var isLoading=false.obs;

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }
  String? validatePassword(String value) {
    RegExp regex =
    RegExp(r'^(?=.*?[a-z]).{8,}$');
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }

  Future<void> login(String email,String password) async{
    isLoading.value=true;
    try {
      final response = await _authRepository.login(email, password);
      if(response !=null){
        Get.snackbar('موفقیت آمیز', 'شما با موفقیت وارد شدید: ${response['token']}');
        Get.toNamed('/base');
      }else{
        Get.snackbar('ناموفق', 'ورود ناموفق');
      }
    }catch(e){
      Get.snackbar('ناموفق', 'ورود ناموفق');
    }finally{
      isLoading.value=false;
    }
  }

}