import 'package:get/get.dart';
import 'package:main_project/src/config/routes/bindings/base_bindings.dart';
import 'package:main_project/src/config/routes/bindings/spalash_bindings.dart';
import 'package:main_project/src/domain/pages/auth/login_page.dart';
import 'package:main_project/src/domain/pages/auth/splash_page.dart';
import '../../domain/pages/base/base_page.dart';

class RoutePage {
  static List<GetPage> routePage=[
    GetPage(name: initialRoute, page: ()=>SplashPage(), binding: SplashBinding()),
    GetPage(name: '/login', page: ()=>LoginPage()),
    GetPage(name: '/base', page: ()=>BasePage(),binding: BaseBindings()),
  ];
  static String initialRoute='/splash';
}