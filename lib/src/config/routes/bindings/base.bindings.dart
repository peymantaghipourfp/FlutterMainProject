import 'package:get/get.dart';
import 'package:main_project/src/domain/cart/controller/shopping_cart.controller.dart';
import 'package:main_project/src/domain/dashboard/controller/dashboard.controller.dart';
import '../../../domain/base/controller/base.controller.dart';
import '../../../domain/product/controller/product.controller.dart';
import '../../../domain/profile/controller/profile.controller.dart';


class BaseBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>BaseController());
    Get.lazyPut(()=>ProductController());
    Get.lazyPut(()=>DashboardController());
    Get.lazyPut(()=>ProfileController());
    Get.lazyPut(()=>ShoppingCartController());
  }

}