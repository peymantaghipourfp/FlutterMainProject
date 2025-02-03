import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
            child: Obx(() {
              return Column(
                children: [
                  //slide image
                   CarouselSlider.builder(
                        itemCount: productController.images.length,
                        itemBuilder: (context, index, realIndex) {
                          return Card(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(productController
                                      .images[index]),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          );
                        },
                        options: CarouselOptions(
                          height: Get.height * 0.20,
                          autoPlay: false,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            productController.updateIndex(index);
                          },
                        )
                    ),
                  //slide circular
                  Row(
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
                              color: productController.currentIndex.value ==
                                  index
                                  ?
                              AppColor.blueColor
                                  :
                              AppColor.inputColor
                          ),
                        );
                      }
                      ).toList(),
                    ),

                  Obx(() {
                    if (productController.isLoading.value) {
                      return CircularProgressIndicator();
                    } else if (productController.errorMessage.isNotEmpty) {
                      return Center(
                        child: Text(productController.errorMessage.value),);
                    } else {
                      return
                        Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: Get.height,
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                mainAxisExtent: 170
                            ),
                            itemCount: productController.productList.length,
                            itemBuilder: (context, index) {
                              var products = productController
                                  .productList[index];
                              return Card(
                                margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                elevation: 5,
                                child:
                                Container(
                                  height: 170,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceEvenly,
                                    children: [
                                      //Image and Rating
                                      Container(
                                        padding: EdgeInsets.only(top: 2),
                                        height: 165,
                                        width: Get.width * 0.45,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceEvenly,
                                          children: [
                                            //image
                                            Container(
                                              height: 120,
                                              width: Get.width * 0.35,
                                              child: Image.network(
                                                  products.image),
                                            ),
                                            //rating
                                            Container(
                                              height: 20,
                                              width: Get.width * 0.35,
                                              child: Row(

                                                children: [
                                                  Text(products.rating.rate.toString(),
                                                  style: TextStyle(fontSize: 10),
                                                  ),
                                                  SizedBox(width: 4,),
                                                  RatingBarIndicator(
                                                    rating: products.rating.rate,
                                                      itemCount: 5,
                                                      itemSize: 12,
                                                      unratedColor: Colors.amber.withAlpha(50),
                                                      direction: Axis.horizontal,
                                                      itemBuilder: (context, index) =>
                                                      SvgPicture.asset("assets/svg/star.svg",color: Colors.amber,),
                                                  ),
                                                  SizedBox(width: 3,),
                                                  Text("${products.rating.count.toString()} :نظرات",
                                                  style: TextStyle(fontSize: 10),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      //title and caregory and price
                                      Container(
                                        height: 165,
                                        width: Get.width * 0.40,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceEvenly,
                                          children: [
                                            //title
                                            Container(
                                              height: 65,
                                              width: Get.width * 0.4,
                                              child: Text(products.title,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14
                                                ),
                                              ),
                                            ),
                                            //category
                                            Container(
                                              height: 35,
                                              width: Get.width * 0.4,
                                              child: Text(products.category,
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ),
                                            //price
                                            Container(
                                              height: 40,
                                              child: ElevatedButton(
                                                onPressed: () {},
                                                child: Text("\قیمت: ${products
                                                    .price} تومان "),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }
                  }),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}

