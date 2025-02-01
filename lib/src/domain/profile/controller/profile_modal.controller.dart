import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:main_project/src/domain/profile/componnent/matched_user.componnent.dart';

class ProfileModalController extends GetxController {
  var showModal=false.obs;
  var isObscured=true.obs;
  var isRepeatObscured=true.obs;

  void toggleObscure(){
    isObscured.value = !isObscured.value;
  }
  void toggleRepeatObscure(){
    isRepeatObscured.value= !isRepeatObscured.value;
  }
}