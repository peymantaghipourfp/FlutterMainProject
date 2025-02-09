import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:main_project/src/domain/cart/controller/shopping_cart.controller.dart';
import 'package:main_project/src/domain/product/controller/buy_detail.controller.dart';

class ShoppingCartPage extends GetView<ShoppingCartController> {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.loadCart();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('سبد خرید'),
          centerTitle: true,
        ),
        body:
        Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Container(
                  child: Obx(() {
                    if (controller.cartList.isEmpty) {
                      return Center(child: Text('سبد خرید شما خالی است'),);
                    } else {
                      return ListView.builder(padding: EdgeInsets.only(
                          bottom: 20),
                        itemCount: controller.cartList.length,
                        itemBuilder: (context, index) {
                          if (index < controller.cartList.length) {
                            var product = controller.cartList[index];
                            return Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Card(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                elevation: 5,
                                child:
                                Stack(
                                    children: [
                                      ListTile(
                                        leading: Image.network(product.image),
                                        title: Text(product.title),
                                        subtitle: Text(
                                            "\قیمت: ${product.price} تومان "),
                                      ),
                                      Positioned(
                                        right: 5, top: 1, bottom: 1,
                                        child: GestureDetector(
                                          onTap: () {
                                            controller.removeCart(index);
                                          },
                                          child: SvgPicture.asset(
                                            'assets/svg/delete.svg', height: 27,
                                            width: 27,
                                          ),
                                        ),
                                      ),
                                    ]
                                ),
                              ),
                            );
                          } else {
                            return SizedBox.shrink();
                          }
                        },
                      );
                    }
                  },
                  ),
                ),
              ),
            ),
            ElevatedButton(
                    onPressed: () {
                      controller.cartList.isEmpty ?
                        Get.defaultDialog(
                            title: 'هشدار',
                            textCancel: 'ok',
                            middleText: 'کالایی وجود ندارد',
                        )
                          :
                          Get.defaultDialog(
                            title: 'پیغام',
                            middleText: '!!!خرید موفق',
                            onCancel: (){controller.removeAllCart();},
                            textCancel: 'ok'
                          );

                          //controller.removeAllCart();

                    },
                    child: Text('تکمیل فرآیند خرید')),
          ],
        ),
      ),
    );
  }
}
