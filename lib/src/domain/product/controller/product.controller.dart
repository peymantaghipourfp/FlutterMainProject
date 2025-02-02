

import 'package:flutter/src/widgets/image.dart';
import 'package:get/get.dart';
import 'package:main_project/src/config/consts/app_image.dart';

class ProductController extends GetxController {
  var images=ImageSlide.slides.obs;
  var imageList=ImageSlide.imageList;
  var currentIndex=0.obs;
  updateIndex(int index) {
    currentIndex.value=index;
    /*for (index=0;index>=0 && index<images.length;index++ ) {
     return images[index];
    }*/
  }
}