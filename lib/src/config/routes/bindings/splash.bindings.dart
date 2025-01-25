
import 'package:get/get.dart';
import '../../../domain/splash/controller/splash.controller.dart';

class SplashBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>SplashController());
  }

}