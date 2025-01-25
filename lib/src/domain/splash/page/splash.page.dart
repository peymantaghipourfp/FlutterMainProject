import 'package:flutter/material.dart';
import 'package:main_project/src/config/consts/app_color.dart';
import 'package:get/get.dart';
import '../controller/splash.controller.dart';

class SplashPage extends StatelessWidget {
   SplashPage({super.key});
  final SplashController splashController=Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 20,),
            Image.asset('assets/images/decomLogo.jpg',height: 200,width: 200,),
            Column(
              children: [
                CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(AppColor.blueColor),),
                SizedBox(height: 10,),
                Text('در حال بارگذاری ...',style: TextStyle(fontSize: 20,fontWeight:FontWeight.w700),),
                SizedBox(height: 30,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
