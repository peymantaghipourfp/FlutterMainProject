import 'package:get/get.dart';
import '../../../domain/base/controller/base_controller.dart';
import '../../../domain/dashboard/page/dashboard_page.dart';
import '../../../domain/home/page/home_page.dart';
import '../../../domain/product/controller/slide_controller.dart';
import '../../../domain/product/page/product_list_page.dart';
import '../../../domain/profile/page/profile_page.dart';
import '../../../domain/tools/page/tools_page.dart';

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