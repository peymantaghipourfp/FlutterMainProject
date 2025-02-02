
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BaseController extends GetxController {
  PageController pageController=PageController(initialPage: 2);

  var navIndex = 2.obs;

  pageChange(int i){
    navIndex.value = i;
    pageController.jumpToPage(i);
    update();
  }
PageController newPageController(){
    return PageController(initialPage: 2);
}
  void resetPage(){
    navIndex.value=2;
    pageController.jumpToPage(2);
  }
}