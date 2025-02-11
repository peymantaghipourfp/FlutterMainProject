import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:main_project/src/config/consts/app_color.dart';
import 'package:main_project/src/domain/cart/model/cart.model.dart';
import 'package:main_project/src/domain/cart/page/shopping_cart.page.dart';
import 'package:main_project/src/domain/product/controller/buy_detail.controller.dart';
import 'package:main_project/src/domain/product/model/product_list.model.dart';

class BuyDetailPage extends GetView<BuyDetailController> {
  const BuyDetailPage({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('جزئیات محصول'),
            actions: [
              IconButton(
                  icon: Stack(
                    children: [
                      Icon(Icons.shopping_cart,size: 27,),
                      if(controller.cartCount > 0)
                        Positioned(
                            top: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.red,
                              child: Text(
                                controller.cartCount.toString(),
                                style: TextStyle(fontSize: 12,color: Colors.white),
                              ),
                            ),
                        ),
                    ],
                  ),
                  onPressed: (){
                   controller.back(4);
                  },
              ),
            ],
          ),
          
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: Get.width,
                  height: Get.height,
                  child: Column(
                    children: [
                      // تصویر محصول
                      Container(
                        padding: EdgeInsets.only(bottom: 10),
                        width: Get.width * 0.8,
                        height: Get.height * 0.4,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Image.network(controller.product.image,),
                        ),
                      ),
                      // عنوان محصول
                      Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(textAlign: TextAlign.center,
                          controller.product.title,
                          style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold,),
                        ),
                      ),

                      // قیمت محصول
                      Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "قیمت: ${controller.product.price} تومان",
                          style: TextStyle(fontSize: 18, color: Colors.green),
                        ),
                      ),

                      // انتخاب سایز و رنگ
                      Text(":انتخاب سایز"),
                      Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                controller.selectedSize.value = 'S';
                              },
                              child: Text("S"),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: controller.selectedSize
                                      .value == 'S'
                                      ? Colors.blue
                                      : Colors.grey
                              ),
                            ),

                            ElevatedButton(
                              onPressed: () {
                                controller.selectedSize.value = 'M';
                              },
                              child: Text("M"),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: controller.selectedSize
                                      .value == 'M'
                                      ? Colors.blue
                                      : Colors.grey
                              ),
                            ),

                            ElevatedButton(
                              onPressed: () {
                                controller.selectedSize.value = 'L';
                              },
                              child: Text("L"),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: controller.selectedSize
                                      .value == 'L'
                                      ? Colors.blue
                                      : Colors.grey
                              ),
                            ),
                          ],
                        ),
                      ),

                      Text(":انتخاب رنگ"),
                      Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...controller.buttonSizes.keys.map((color) {
                              return ElevatedButton(
                                onPressed: () {
                                  controller.setButtonSize(color);
                                },
                                child: CircleAvatar(radius: 0,),
                                style:
                                ElevatedButton.styleFrom(
                                    backgroundColor: color,
                                    minimumSize: controller.buttonSizes[color]!,

                                    shape: CircleBorder()
                                ),
                              );
                            },
                            ),
                          ],
                        ),
                      ),
                      // دکمه افزودن به سبد خرید
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.buttonColor
                        ),
                        onPressed: () {
                          controller.addToCart(controller.product);
                          Get.snackbar('به سبد خرید اضافه شد', '${controller.product.title} ',snackPosition: SnackPosition.BOTTOM);
                        },
                        child: Text("افزودن به سبد خرید",style: TextStyle(color: AppColor.blackColor),),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}