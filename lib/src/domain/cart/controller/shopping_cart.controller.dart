

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:main_project/src/domain/cart/model/cart.model.dart';
import 'package:main_project/src/domain/product/controller/buy_detail.controller.dart';

import '../../product/model/product_list.model.dart';

class ShoppingCartController extends GetxController {
  var cartList=<CartModel>[].obs;
  late Box<CartModel> cartBox;

  @override
  void onInit() {
    super.onInit();
    cartBox=Hive.box<CartModel>('carts');
    loadCart();
  }
  void loadCart(){
    cartList.clear();
    if(cartBox.isNotEmpty) {
      cartList.addAll(cartBox.values);
      update();
    }
  }
  void removeCart(int index){
    if(index>=0 && index<cartBox.length) {
      cartBox.deleteAt(index);
      cartList.assignAll(cartBox.values);
      update();

    }
  }
  void removeAllCart(){
    cartBox.clear();
    cartList.clear();
    update();
  }
}
