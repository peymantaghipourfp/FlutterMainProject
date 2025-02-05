
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main_project/src/domain/cart/controller/shopping_cart.controller.dart';

class ShoppingCartPage extends GetView<ShoppingCartController> {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('سبد خرید'),
          centerTitle: true,
        ),
        body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Padding(
              padding: EdgeInsets.all(16),
            child: Obx((){
              if(controller.cartItems.isEmpty){
                return Center(child: Text('سبد خرید شما خالی است'),);
              }else{
                return ListView.builder(
                  itemCount: controller.cartItems.length ,
                    itemBuilder:(context, index) {
                      var product=controller.cartItems[index];
                      return Card(
                        child: ListTile(
                          leading: Image.network(product.image),
                          title: Text(product.title),
                          subtitle: Text("\قیمت: ${product.price} تومان "),
                        ),
                      );
                    } ,
                );
              }
            },
            ),
          ),
        ),
      ),
    );
  }
}
