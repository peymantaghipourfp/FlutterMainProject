import 'package:get/get.dart';
import 'package:main_project/src/config/routes/bindings/auth.bindings.dart';
import 'package:main_project/src/config/routes/bindings/base.bindings.dart';
import 'package:main_project/src/config/routes/bindings/buy_detail.bindings.dart';
import 'package:main_project/src/config/routes/bindings/splash.bindings.dart';
import 'package:main_project/src/domain/cart/page/shopping_cart.page.dart';
import '../../domain/auth/page/login.page.dart';
import '../../domain/auth/page/register.page.dart';
import '../../domain/base/page/base.page.dart';
import '../../domain/product/page/buy_detail.page.dart';
import '../../domain/splash/page/splash.page.dart';

class RoutePage {
  static List<GetPage> routePage=[
    GetPage(name: initialRoute, page: ()=>SplashPage(), binding: SplashBinding()),
    GetPage(name: '/login', page: ()=>LoginPage(),binding: AuthBindings()),
    GetPage(name: '/register', page: ()=>RegisterPage(),binding: AuthBindings()),
    GetPage(name: '/base', page: ()=>BasePage(),binding:BaseBindings()),
    GetPage(name: '/buyDetail', page: ()=>BuyDetailPage(),binding: BuyDetailBindings()),
  ];
  static String initialRoute='/splash';
}