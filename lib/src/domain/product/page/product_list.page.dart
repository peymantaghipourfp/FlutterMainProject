import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../config/consts/app_color.dart';
import '../controller/product.controller.dart';


class ProductListPage extends StatelessWidget {
  ProductListPage({super.key});

  final ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('لیست محصولات'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Obx(() {
                  return CarouselSlider.builder(
                      itemCount: productController.images.length,
                      itemBuilder: (context, index, realIndex) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(productController
                                  .images[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        height: Get.height * 0.25,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          productController.updateIndex(index);
                        },
                      )
                  );
                }),
                Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: productController.images.map((i) {
                      int index = productController.images.indexOf(i);
                      return Container(
                        width: 8,
                        height: 8,
                        margin: EdgeInsets.symmetric(
                            horizontal: 3, vertical: 10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: productController.currentIndex.value == index
                                ?
                            AppColor.blueColor
                                :
                            AppColor.inputColor
                        ),
                      );
                    }
                    ).toList(),
                  );
                }),
                Obx(() {
                  if(productController.isLoading.value){
                    return CircularProgressIndicator();
                  }else if(productController.errorMessage.isNotEmpty){
                    return Center(child: Text(productController.errorMessage.value),);
                  }else {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: Get.height * .5,
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5
                          ),
                          itemCount: productController.productList.length,
                          itemBuilder: (context, index) {
                            var products=productController.productList[index];
                            return Card(
                              child: Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 27),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          topLeft: Radius.circular(10)),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            products.image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),

                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      width: double.infinity,
                                      height: 25,
                                      padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                                      decoration: BoxDecoration(
                                        color: AppColor.inputColor.withOpacity(
                                            .5),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        ),
                                      ),

                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceEvenly,
                                        children: [
                                          InkWell(
                                            child: SvgPicture.asset(
                                              'assets/svg/buy-cart.svg',
                                              width: 23,
                                              height: 25,
                                            ),
                                            onTap: () {
                                              Get.toNamed('/buyCart');
                                            },
                                          ),
                                          SizedBox(width: 30,),
                                          Text(
                                            " \$${(index + 1) * 10} :قیمت ",
                                            // مثال قیمت
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.start,
                                          ),
                                        ],
                                      ),

                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

