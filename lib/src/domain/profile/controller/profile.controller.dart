import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:main_project/src/domain/auth/controller/auth.controller.dart';
import 'package:main_project/src/domain/base/controller/base.controller.dart';

class ProfileController extends GetxController {
  BaseController baseController = Get.find<BaseController>();
  var email=Rx<String?>(null);
  var isLoading=true.obs;
  final storage=GetStorage();
  var isObscured=true.obs;
  var isRepeatObscured=true.obs;

  void toggleObscure(){
    isObscured.value = !isObscured.value;
  }
  void toggleRepeatObscure(){
    isRepeatObscured.value= !isRepeatObscured.value;
  }

  Future<void> logout() async {
    await storage.remove('accessToken');
    Future.delayed(Duration(milliseconds: 500), () {
      Get.offNamed('/login');
    });
  }
}
