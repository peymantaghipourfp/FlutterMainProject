import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:main_project/src/config/consts/app_size.dart';
import 'package:main_project/src/domain/profile/componnent/matched_user.componnent.dart';
import 'package:main_project/src/domain/profile/controller/profile_modal.controller.dart';
import 'package:main_project/src/domain/profile/controller/user.controller.dart';
import 'package:main_project/src/widget/input_textField.widget.dart';

import '../../../config/consts/app_color.dart';
import '../model/user.model.dart';

class ProfileEditModal extends StatefulWidget {
  ProfileEditModal({super.key});

  @override
  State<ProfileEditModal> createState() => _ProfileEditModalState();
}

class _ProfileEditModalState extends State<ProfileEditModal> {
  final formKey = GlobalKey<FormState>();

  late TextEditingController _fullNameController;

  late TextEditingController _emailController;

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _rePasswordController = TextEditingController();

  //ProfileModalController profileModalController = Get.put(ProfileModalController());
  ProfileModalController profileModalController=Get.find<ProfileModalController>();
  var userController=Get.find<UserController>();

  @override
  void initState() {
    final user=matchedUser(userController);
    _fullNameController=TextEditingController(
     text:  '${user?.firstName}' ' ' '${user?.lastName}'
    );
    _emailController=TextEditingController(
      text: user?.email
    );
    super.initState();
  }

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
                child: SingleChildScrollView(
                  child: SizedBox(
                    /*width: Get.width * 0.85,
                    height: Get.height * 0.8,*/
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
                            key: formKey,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 10),
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child:
                                    /*InputTextField(
                                      controller: _fullNameController,
                                      hintText: 'نام و نام خانوادگی',
                                    ),*/
                                    TextFormField(
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
                                          suffixIcon: GestureDetector(
                                            child: SvgPicture.asset(
                                              profileModalController.isObscured.value
                                                  ? 'assets/svg/eye-opened.svg'
                                                  : 'assets/svg/eye-closed.svg',

                                            ),
                                            onTap: () {
                                              profileModalController.toggleObscure();
                                            },
                                          ),
                                        ),
                                        obscureText: profileModalController.isObscured
                                            .value,
                                        controller: _passwordController,
                                      );
                                    }),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 10),
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Obx(() {
                                      return TextFormField(
                                        validator: (value) {
                                          if (value != _passwordController.text) {
                                            return 'پسوردها با هم مطابقت ندارند';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: AppColor.inputColor,
                                          hintText: 'ورود مجدد پسورد',
                                          suffixIcon: GestureDetector(
                                            child: SvgPicture.asset(
                                              profileModalController.isRepeatObscured
                                                  .value
                                                  ? 'assets/svg/eye-opened.svg'
                                                  : 'assets/svg/eye-closed.svg',

                                            ),
                                            onTap: () {
                                              profileModalController
                                                  .toggleRepeatObscure();
                                            },
                                          ),
                                        ),
                                        obscureText: profileModalController
                                            .isRepeatObscured.value,
                                        controller: _rePasswordController,
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
                            if (formKey.currentState!.validate()) {
                              Get.back();
                            } else {
                              Get.snackbar('خطا', 'فیلد ها را به درستی پر کنید');
                            }
                          },
                          child: Text("ویرایش"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          child: SizedBox(
            width: 40,
              height: 40,
              child: SvgPicture.asset('assets/svg/edit.svg', height: 40, width: 40,))
      ),
    );
  }
}
