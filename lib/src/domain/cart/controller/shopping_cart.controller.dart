

import 'package:get/get.dart';
import 'package:main_project/src/domain/product/model/product_list.model.dart';

class ShoppingCartController extends GetxController {
  var cartItems=<ProductListModel>[].obs;
  var quantity=1.obs;

  void addToCart(ProductListModel product){
    cartItems.add(product);
  }

  int get cartCount=>cartItems.length;

}