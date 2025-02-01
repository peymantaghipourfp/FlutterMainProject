import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:main_project/src/domain/auth/controller/auth_controller.dart';

class ProfileController extends GetxController {
  var email=Rx<String?>(null);
  var isLoading=true.obs;
  /*Future<void> loadUserData()async{
    AuthController authController=Get.find<AuthController>();
    await authController.extractUserInfoFromToken();
    final storage=GetStorage();
    email.value=storage.read('email');
    isLoading.value=false;
  }*/
}