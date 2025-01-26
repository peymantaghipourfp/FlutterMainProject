import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:main_project/src/config/consts/app_color.dart';
import 'package:get/get.dart';
import 'package:main_project/src/domain/auth/controller/auth_controller.dart';
import 'package:main_project/src/domain/auth/model/register_model.dart';
import 'package:main_project/src/domain/profile/componnent/profile_edit_modal.widget.dart';
import 'package:main_project/src/domain/profile/controller/user.controller.dart';
import 'package:get_storage/get_storage.dart';
import 'package:main_project/src/domain/profile/model/user.model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

/*class _ProfilePageState extends State<ProfilePage> {
  var userController = Get.find<UserController>();
  var authController=Get.find<AuthController>();
  final storage=GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [
              Obx(() {
                if (userController.isLoading.value) {
                  return Text('خطا',style: TextStyle(fontSize: 30),);
                }
                final matchUser=userController.userList.firstWhere(
                    (user)=>storage.read('id')==user.id
                );
                if(matchUser!=null){
                  return Text(matchUser.firstName.toString());
                }else{
                  return Text('نامشخص');
                }
              },
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/

class _ProfilePageState extends State<ProfilePage> {
  var userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
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
                              ), */
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
                              Obx(
                                () {
                                  UserModel matchUser = matchedUser();
                                  if (matchUser != null) {
                                    return
                                      Text(
                                        '${matchUser.firstName.toString()} ${matchUser.lastName.toString()}');
                                  } else {
                                    return Text('');
                                  }
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Obx(
                                    () {
                                  UserModel matchUser = matchedUser();
                                  if (matchUser != null) {
                                    return Text(matchUser.email.toString());
                                  } else {
                                    return Text('');
                                  }
                                },
                              ),
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
      ),
    );
  }

  UserModel matchedUser() {
    final matchUser = userController.userList
        .firstWhere((user) =>
            storage.read('id') == user.id);
    return matchUser;
  }
}
