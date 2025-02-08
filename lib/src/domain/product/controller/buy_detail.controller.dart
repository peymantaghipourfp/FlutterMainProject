
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:main_project/src/domain/base/controller/base.controller.dart';
import 'package:main_project/src/domain/cart/model/cart.model.dart';

import '../model/product_list.model.dart';

class BuyDetailController extends GetxController{
  BaseController baseController=Get.find<BaseController>();
  late ProductListModel product;
  var selectedSize='M'.obs;
  var buttonSizes=<Color,Size>{}.obs;
@override
  void onInit() {
    super.onInit();
    product=Get.arguments;
    _cartBox=Hive.box<CartModel>('carts');
    loadCarts();
  }
BuyDetailController(){
  buttonSizes[Colors.redAccent]=Size(30, 30);
  buttonSizes[Colors.indigoAccent]=Size(30, 30);
  buttonSizes[Colors.teal]=Size(30, 30);
  buttonSizes[Colors.brown]=Size(30, 30);
  buttonSizes[Colors.white30]=Size(30, 30);
}
  void setSize(String size){
    selectedSize.value=size;
  }
  void setButtonSize(Color color){
   buttonSizes.updateAll((key, value) => Size(30, 30),);
   buttonSizes[color]=Size(45, 45);
  }
  var cartList=<CartModel>[].obs;
  Box<CartModel>? _cartBox;
  var cartItems=<ProductListModel>[].obs;
  var quantity=1.obs;

  void loadCarts(){
    cartList.value=_cartBox?.values.toList() ?? [];
  }
   addToCart(ProductListModel product){
    _cartBox?.add(CartModel(id: product.id, title: product.title, image: product.image, price: product.price));
    loadCarts();
  }

  int get cartCount=>cartList.length;

  void back(int i){
    Get.back();
    //Get.toNamed('/base');
    baseController.pageChange(i);
  }
}