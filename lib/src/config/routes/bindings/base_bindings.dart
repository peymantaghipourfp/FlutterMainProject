import 'package:get/get.dart';
import 'package:main_project/src/domain/controllers/base_controller.dart';
import 'package:main_project/src/domain/controllers/slide_controller.dart';
import 'package:main_project/src/domain/pages/dashboard/dashboard_page.dart';
import 'package:main_project/src/domain/pages/home/home_page.dart';
import 'package:main_project/src/domain/pages/product/product_list_page.dart';
import 'package:main_project/src/domain/pages/profile/profile_page.dart';
import 'package:main_project/src/domain/pages/tools/tools_page.dart';

class BaseBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>BaseController());
    Get.lazyPut(()=>SlideController());
    Get.lazyPut(()=>ProfilePage());
    Get.lazyPut(()=>HomePage());
    Get.lazyPut(()=>DashboardPage());
    Get.lazyPut(()=>ProductListPage());
    Get.lazyPut(()=>ToolsPage());
  }

}