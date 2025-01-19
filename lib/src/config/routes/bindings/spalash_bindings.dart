
import 'package:get/get.dart';
import 'package:main_project/src/domain/controllers/splash_controller.dart';

class SplashBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>SplashController());
  }

}