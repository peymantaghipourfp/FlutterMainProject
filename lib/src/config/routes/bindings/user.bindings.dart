

import 'package:get/get.dart';
import 'package:main_project/src/domain/profile/controller/profile_modal.controller.dart';


class UserBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>ProfileModalController());
  }

}