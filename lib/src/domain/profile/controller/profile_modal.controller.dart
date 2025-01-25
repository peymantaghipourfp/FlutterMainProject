import 'package:get/get.dart';

class ProfileModalController {
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