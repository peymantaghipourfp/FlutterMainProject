import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuyCartPage extends StatelessWidget {
  const BuyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('BuyCart'),),
        body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [
            ],
          ),
        ),
      ),
    );
  }
}