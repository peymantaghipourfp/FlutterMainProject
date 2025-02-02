

import 'package:flutter/src/widgets/image.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:main_project/src/config/consts/app_image.dart';
import 'package:main_project/src/config/repository/product_list.repository.dart';
import 'package:main_project/src/domain/product/model/product_list.model.dart';

class ProductController extends GetxController {
  var images=ImageSlide.slides.obs;
  var imageList=ImageSlide.imageList;
  var currentIndex=0.obs;
  updateIndex(int index) {
    currentIndex.value=index;

  }
  var isLoading=true.obs;
  var productList=<ProductListModel>[].obs;
  var errorMessage=''.obs;

  final ProductListRepository _productListRepository=ProductListRepository();

  @override
  void onInit(){
    super.onInit();
    fetchProductList();
  }
  Future<void> fetchProductList() async{
    try{
      isLoading.value=true;
      var fetchedProductList=await _productListRepository.getProductList();
      productList.assignAll(fetchedProductList);
    }catch(e){
      errorMessage.value='خطایی هنگام بارگذاری پیش آمده است ${e.toString()}';
    }finally{
      isLoading.value=false;
    }
  }
}