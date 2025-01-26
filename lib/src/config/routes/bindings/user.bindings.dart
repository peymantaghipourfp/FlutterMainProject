

import 'package:get/get.dart';
import 'package:main_project/src/domain/profile/controller/user.controller.dart';

class UserBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>UserController());
  }

}