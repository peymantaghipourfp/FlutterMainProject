import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:main_project/src/config/consts/app_color.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                 Stack(
                   textDirection: TextDirection.rtl,
                   children: [
                        Container(
                         color: AppColor.inputColor,
                         width: Get.width,
                         height: 100,
                       ),
                        Card(
                         color: AppColor.inputColor,
                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                         child: SvgPicture.asset('assets/svg/person.svg',height: 100,width: 100,fit: BoxFit.cover,),
                       ),
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     Text('اسکای',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700),)
                   ],
                 )
               ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
