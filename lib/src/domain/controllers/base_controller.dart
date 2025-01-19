
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BaseController extends GetxController {
  PageController pageController=PageController(initialPage: 2);

  var navIndex = 2.obs;

  pageChange(int i){
    pageController.jumpToPage(i);
  }

}