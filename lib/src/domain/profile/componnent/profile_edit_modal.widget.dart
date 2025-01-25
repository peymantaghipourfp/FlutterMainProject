import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:main_project/src/domain/profile/controller/profile_modal.controller.dart';

class ProfileEditModal extends StatelessWidget {
  ProfileEditModal({super.key});
  ProfileModalController profileModalController=Get.find<ProfileModalController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
          onTap: (){

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
          child: SvgPicture.asset('assets/svg/edit.svg',height: 40,width: 40,)
      ),
    );
  }
}
