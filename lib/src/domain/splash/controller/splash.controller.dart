

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController{
  final storage=GetStorage();
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 3),(){
      _checkLoginStatus();
    });
  }
  void _checkLoginStatus(){
    String? accessToken=storage.read('accessToken');
    if(accessToken!=null) {
      Get.offNamed('/base'); // انتقال به صفحه اصلی
    }else{
      Get.offNamed('/login');
    }
  }
}