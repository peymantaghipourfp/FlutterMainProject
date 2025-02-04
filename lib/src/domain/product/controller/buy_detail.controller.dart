
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/product_list.model.dart';

class BuyDetailController extends GetxController{
  late ProductListModel product;
  var selectedSize='M'.obs;
  var buttonSizes=<Color,Size>{}.obs;
@override
  void onInit() {
    super.onInit();
    product=Get.arguments;
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

}