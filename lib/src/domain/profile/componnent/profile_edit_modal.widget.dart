import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:main_project/src/domain/profile/controller/profile_modal.controller.dart';

import '../../../config/consts/app_color.dart';

class ProfileEditModal extends StatelessWidget {
  ProfileEditModal({super.key});

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  ProfileModalController passwordController = Get.find<
      ProfileModalController>();

  //ProfileModalController profileModalController=Get.find<ProfileModalController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
          onTap: () {
            Get.dialog(
              Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SizedBox(
                  width: Get.width * 0.95,
                  height: Get.height * 0.9,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(padding: EdgeInsets.only(top: 7, left: 10),
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            child: SvgPicture.asset('assets/svg/back.svg'),
                            onTap: () {
                              Get.back();
                            },)),
                      Text("ویرایش کاربر", style: TextStyle(fontSize: 18)),
                      SizedBox(height: 10),
                      Form(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: AppColor.inputColor,
                                    hintText: 'نام و نام خانوادگی',
                                  ),
                                  controller: _fullNameController,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: AppColor.inputColor,
                                    hintText: 'ایمیل',
                                  ),
                                  controller: _emailController,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Obx(() {
                                  return TextFormField(
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: AppColor.inputColor,
                                      hintText: 'پسورد',

                                    ),
                                    obscureText: true,
                                    controller: _passwordController,
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Get.back(); // بستن دیالوگ
                        },
                        child: Text("بستن"),
                      ),
                    ],
                  ),
                ),
              ),
            );

            /*showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SizedBox(
                    width: Get.width*0.9,
                    height: Get.height,
                    child:
                    Text('ویرایش کاربر'),
                  );
                },
            );*/
          },
          child: SvgPicture.asset('assets/svg/edit.svg', height: 40, width: 40,)
      ),
    );
  }
}
