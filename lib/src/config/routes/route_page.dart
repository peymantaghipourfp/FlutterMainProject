import 'package:get/get.dart';
import 'package:main_project/src/config/routes/bindings/auth_bindings.dart';
import 'package:main_project/src/config/routes/bindings/base_bindings.dart';
import 'package:main_project/src/config/routes/bindings/spalash_bindings.dart';
import '../../domain/auth/page/login_page.dart';
import '../../domain/base/page/base_page.dart';
import '../../domain/product/page/buy_cart_page.dart';
import '../../domain/splash/page/splash_page.dart';

class RoutePage {
  static List<GetPage> routePage=[
    GetPage(name: initialRoute, page: ()=>SplashPage(), binding: SplashBinding()),
    GetPage(name: '/login', page: ()=>LoginPage(),binding: AuthBindings()),
    GetPage(name: '/base', page: ()=>BasePage(),binding: BaseBindings()),
    GetPage(name: '/buyCart', page: ()=>BuyCartPage()),
  ];
  static String initialRoute='/splash';
}