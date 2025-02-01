import 'package:get/get.dart';
import 'package:main_project/src/domain/auth/controller/auth_controller.dart';
import 'package:main_project/src/domain/dashboard/controller/dashboard_controller.dart';
import 'package:main_project/src/domain/profile/controller/profile_controller.dart';
import '../../../domain/base/controller/base_controller.dart';
import '../../../domain/dashboard/page/dashboard.page.dart';
import '../../../domain/home/page/home.page.dart';
import '../../../domain/product/controller/product_slide.controller.dart';
import '../../../domain/product/page/product_list.page.dart';
import '../../../domain/profile/page/profile.page.dart';
import '../../../domain/tools/page/tools.page.dart';

class BaseBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>BaseController());
    Get.lazyPut(()=>ProductSlideController());
    Get.lazyPut(()=>DashboardController());
    //Get.lazyPut(()=>ProfileController());
    Get.lazyPut(()=>ProfilePage());
    Get.lazyPut(()=>HomePage());
    Get.lazyPut(()=>DashboardPage());
    Get.lazyPut(()=>ProductListPage());
    Get.lazyPut(()=>ToolsPage());
  }

}