
import 'package:get/get.dart';
import 'package:main_project/src/domain/product/controller/buy_detail.controller.dart';

class BuyDetailBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>BuyDetailController());
  }

}