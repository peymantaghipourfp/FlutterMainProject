import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get.dart';
import 'package:main_project/src/config/consts/app_color.dart';
import 'package:main_project/src/domain/controllers/base_controller.dart';
import 'package:main_project/src/domain/pages/dashboard/dashboard_page.dart';
import 'package:main_project/src/domain/pages/home/home_page.dart';
import 'package:main_project/src/domain/pages/product/product_list_page.dart';
import 'package:main_project/src/domain/pages/profile/profile_page.dart';
import 'package:main_project/src/domain/pages/tools/tools_page.dart';


class BasePage extends StatelessWidget {
  BasePage({super.key});

  BaseController baseController = Get.find<BaseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        centerTitle: true,
      ),*/
      bottomNavigationBar: Obx(() {
        return SnakeNavigationBar.color(height: Get.height*.08,
          behaviour: SnakeBarBehaviour.pinned,
          backgroundColor: AppColor.backgroundColor,
          snakeShape: SnakeShape.circle,
          padding: EdgeInsets.all(0),
          snakeViewColor: AppColor.inputColor,
          selectedItemColor: AppColor.darkCyanColor,
          unselectedItemColor: AppColor.inputColor,
          showUnselectedLabels: false,
          showSelectedLabels: true,
          currentIndex: baseController.navIndex.value,
          onTap: (index) {
            baseController.navIndex.value = index;
            baseController.pageChange(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,size: baseController.navIndex.value == 0 ? 30 : 24,),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_outlined,size: baseController.navIndex.value == 1 ? 30 : 24,),
              label: 'list',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard,size: baseController.navIndex.value == 2 ? 30 : 24,),
              label: 'dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person,size: baseController.navIndex.value == 3 ? 30 : 24,),
              label: 'profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_vert,size: baseController.navIndex.value == 4 ? 30 : 24,),
              label: 'more',
            ),
          ],
        );
      }),
      body: PageView(
        controller: baseController.pageController,
       onPageChanged:(index) {baseController.navIndex.value = index;},
       children: [
         HomePage(),
         ProductListPage(),
         DashboardPage(),
         ProfilePage(),
         ToolsPage()
       ],
      )
    );
  }
}
