import 'package:get/get.dart';
import 'package:main_project/src/domain/controllers/base_controller.dart';
import 'package:main_project/src/domain/pages/home/home_page.dart';
import 'package:main_project/src/domain/pages/profile/profile_page.dart';

class BaseBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>BaseController());
    Get.lazyPut(()=>ProfilePage());
    Get.lazyPut(()=>HomePage());
  }

}