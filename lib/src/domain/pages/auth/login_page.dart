import 'package:flutter/material.dart';
import 'package:main_project/src/config/consts/app_color.dart';
import 'package:get/get.dart';
import 'package:main_project/src/widget/input_textField.widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: Get.width,
                  height: Get.height * .38,
                  decoration: BoxDecoration(
                      color: AppColor.whiteColor,
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: Image.asset('assets/images/logo.png').image)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: Text('صفحه ورود',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 1,left: 17,right: 17),
              child: Divider(color: AppColor.inputColor,height: 1,),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 10),
                    child: InputTextField(
                      hintText: 'ایمیل',
                      labelText: 'لطفا ایمیل خود را وارد کنید',
                      controller: _emailController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 30),
                    child: InputTextField(
                        labelText: 'لطفا پسورد خود را وارد کنید',
                        hintText: 'پسورد',
                        obscureText: true,
                      controller: _passwordController,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.blueColor,
                      minimumSize: Size(80, 45),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      elevation: 0,
                    ),
                    onPressed: () {
                      Get.toNamed('/base');
                    },
                    child: Text('وارد شوید',style: TextStyle(color: AppColor.whiteColor,fontWeight: FontWeight.w700,),
                  ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
