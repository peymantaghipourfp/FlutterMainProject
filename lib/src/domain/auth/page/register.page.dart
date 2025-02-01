import 'package:flutter/material.dart';
import 'package:main_project/src/config/consts/app_color.dart';
import 'package:get/get.dart';
import 'package:main_project/src/domain/auth/controller/auth_controller.dart';
import 'package:main_project/src/widget/input_textField.widget.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController=TextEditingController();
  final formKey = GlobalKey<FormState>();
  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(automaticallyImplyLeading: false,),
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
                          image: Image
                              .asset('assets/images/logo.png')
                              .image)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: Text('صفحه ثبت نام',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 1, left: 17, right: 17),
              child: Divider(color: AppColor.inputColor, height: 1,),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColor.inputColor,
                            hintText: 'نام و نام خانوادگی',
                            labelText: 'لطفا نام و نام خانوادگی را وارد کنید',
                          ),

                          controller: _fullNameController,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 10),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColor.inputColor,
                            hintText: 'ایمیل',
                            labelText: 'لطفا ایمیل خود را وارد کنید',
                          ),
                          validator: (value) =>
                              authController.validateEmail(value),
                          controller: _emailController,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 30),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColor.inputColor,
                            labelText: 'لطفا پسورد خود را وارد کنید',
                            hintText: 'پسورد',
                          ),
                          validator: (value) =>
                              authController.validatePassword(value!),
                          obscureText: true,
                          controller: _passwordController,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Obx(() => authController.isLoading.value?
            CircularProgressIndicator()
                : ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.blueColor,
                minimumSize: Size(80, 45),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 0,
              ),
              /*onPressed: (){
                Get.toNamed('/login');
              },*/
              onPressed: () async{if(formKey.currentState!.validate()) {
                  await authController.register(
                      _fullNameController.text,
                      _emailController.text,
                      _passwordController.text);
                }
                },
              child: Text('ثبت نام', style: TextStyle(
                color: AppColor.whiteColor, fontWeight: FontWeight.w700,),
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
