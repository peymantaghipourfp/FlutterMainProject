import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:main_project/src/config/consts/app_color.dart';
import 'package:get/get.dart';
import 'package:main_project/src/domain/profile/componnent/profile_edit_modal.widget.dart';
import 'package:main_project/src/domain/profile/controller/user.controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var userController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                    child: Stack(
                      textDirection: TextDirection.rtl,
                      children: [
                        Container(alignment: Alignment.bottomLeft,
                          color: AppColor.inputColor,
                          width: Get.width,
                          height: 100,
                          child:
                          ProfileEditModal(),
                          /*GestureDetector(
                              onTap: (){
                                Get.toNamed('/buyCart');
                              },
                                child: SvgPicture.asset('assets/svg/edit.svg',height: 40,width: 40,)
                            ),*/
                        ),
                        Positioned(
                          top: 40,
                          right: 10,
                          child: Card(
                            color: AppColor.whiteColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                                side: BorderSide(
                                    color: AppColor.whiteColor, width: 2)
                            ),
                            child: SvgPicture.asset(
                              'assets/svg/person.svg', height: 100,
                              width: 100,
                              fit: BoxFit.cover,),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, top: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                              Text(
                                /*'${(index) {
                                  userController.userList[index].firstName;
                                }}',*/'',
                                style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w700),)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('اصفهان , ایران', style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
