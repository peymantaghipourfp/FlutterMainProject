

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:main_project/src/domain/cart/model/cart.model.dart';

import '../../product/model/product_list.model.dart';

class ShoppingCartController extends GetxController {
  var cartList=<CartModel>[].obs;
  Box<CartModel>? _cartBox;

  @override
  void onInit() {
    super.onInit();
    _cartBox=Hive.box<CartModel>('carts');
    loadCarts();
  }
  void loadCarts(){
    cartList.value=_cartBox?.values.toList() ?? [];
  }
  void addCarts(ProductListModel cart){
    _cartBox?.add(CartModel(id: cart.id, title: cart.title, image: cart.image, price: cart.price));
    loadCarts();
  }
}
