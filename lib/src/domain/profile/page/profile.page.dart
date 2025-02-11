import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:main_project/src/config/consts/app_color.dart';
import 'package:get/get.dart';
import 'package:main_project/src/domain/auth/controller/auth.controller.dart';
import 'package:get_storage/get_storage.dart';
import 'package:main_project/src/domain/profile/controller/profile.controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.find<ProfileController>();


    return SafeArea(
      child: SizedBox(
        width: Get.width * 0.9,
        height: Get.height * 0.9,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                    child: Stack(
                      textDirection: TextDirection.rtl,
                      children: [
                        Container(alignment: Alignment.bottomLeft,
                          color: AppColor.inputColor,
                          width: double.infinity,
                          height: 100,
                          /*child:
                          SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: SvgPicture.asset('assets/svg/edit.svg', height: 40, width: 40,),
                                    ),*/
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 33, top: 3),
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: () {
                              profileController.logout();
                            },
                            child: Text(
                              'خروج',
                              style: TextStyle(
                                fontSize: 20
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 2,top: 2),
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: () {
                              profileController.logout();
                            },
                            child: SvgPicture.asset(
                              'assets/svg/exit.svg',
                              width: 35,
                              height: 35,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 40,
                          right: 10,
                          child: Card(
                            color: AppColor.whiteColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                                side: BorderSide(
                                    color: AppColor.whiteColor, width: 2)
                            ),
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child:
                              ClipRRect(borderRadius: BorderRadius.circular(50),
                                child: SvgPicture.asset(
                                  'assets/svg/person.svg',
                                  fit: BoxFit.cover,),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30, top: 10),
                    child: Column(
                      textDirection: TextDirection.rtl,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            /*Obx(() {
                              return profileController.isLoading.value
                                ? CircularProgressIndicator()
                                  : Text(profileController.email.value ?? '');
                            }),*/
                            Text('peyman',style: TextStyle(fontSize: 18),),
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
