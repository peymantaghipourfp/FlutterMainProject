import 'package:flutter/material.dart';
import 'package:main_project/src/config/consts/app_color.dart';
import 'package:main_project/src/domain/controllers/slide_controller.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductListPage extends StatelessWidget {
  ProductListPage({super.key});

  final SlideController slideController = Get.find<SlideController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                    SizedBox(
                      height: Get.height*.5,
                      child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5
                          ),
                          itemCount: slideController.images.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(slideController.images[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
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

