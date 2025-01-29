import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../config/consts/app_color.dart';
import '../controller/product_slide.controller.dart';


class ProductListPage extends StatelessWidget {
  ProductListPage({super.key});

  final ProductSlideController slideController = Get.find<ProductSlideController>();

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
                      itemCount: slideController.images.length,
                      itemBuilder: (context, index, realIndex) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(image: AssetImage(slideController
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
                          slideController.updateIndex(index);
                        },
                      )
                  );
                }),
                Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: slideController.images.map((i) {
                      int index = slideController.images.indexOf(i);
                      return Container(
                        width: 8,
                        height: 8,
                        margin: EdgeInsets.symmetric(horizontal: 3,vertical: 10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: slideController.currentIndex.value == index ?
                            AppColor.blueColor :
                            AppColor.inputColor
                        ),
                      );
                    }
                    ).toList(),
                  );
                }),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: Get.height*.5,
                        child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5
                            ),
                            itemCount: slideController.imageList.length,
                            itemBuilder: (context, index) {
                              return Card(
                                 child: Stack(
                                  children:[
                                    Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 27),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                                      image: DecorationImage(
                                        image: AssetImage(slideController.imageList[index]),
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
                                          color: AppColor.inputColor.withOpacity(.5),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                        ),
                                        
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                              child: SvgPicture.asset('assets/svg/buy-cart.svg',
                                                width: 23,
                                                height: 25,
                                              ),
                                              onTap: (){
                                                Get.toNamed('/buyCart');
                                              },
                                            ),
                                            SizedBox(width: 30,),
                                            Text(
                                              " \$${(index + 1) * 10} :قیمت ", // مثال قیمت
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
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

