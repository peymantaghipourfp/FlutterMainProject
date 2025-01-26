import 'package:get/get.dart';
import 'package:main_project/src/config/routes/bindings/auth.bindings.dart';
import 'package:main_project/src/config/routes/bindings/base.bindings.dart';
import 'package:main_project/src/config/routes/bindings/splash.bindings.dart';
import 'package:main_project/src/config/routes/bindings/user.bindings.dart';
import 'package:main_project/src/domain/profile/controller/user.controller.dart';
import '../../domain/auth/page/login.page.dart';
import '../../domain/auth/page/register.page.dart';
import '../../domain/base/page/base.page.dart';
import '../../domain/product/page/buy_cart.page.dart';
import '../../domain/splash/page/splash.page.dart';

class RoutePage {
  static List<GetPage> routePage=[
    GetPage(name: initialRoute, page: ()=>SplashPage(), binding: SplashBinding()),
    GetPage(name: '/login', page: ()=>LoginPage(),binding: AuthBindings()),
    GetPage(name: '/register', page: ()=>RegisterPage(),binding: AuthBindings()),
    GetPage(name: '/base', page: ()=>BasePage(),bindings:[ BaseBindings(),UserBindings()]),
    GetPage(name: '/buyCart', page: ()=>BuyCartPage()),
  ];
  static String initialRoute='/splash';
}