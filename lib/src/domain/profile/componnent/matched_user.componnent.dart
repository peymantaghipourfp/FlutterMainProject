

import 'package:main_project/src/domain/profile/controller/user.controller.dart';

import '../model/user.model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

//var userController=Get.find<UserController>();
final storage=GetStorage();

UserModel matchedUser(UserController userController) {
    final matchUser = userController.userList
        .firstWhere((user) =>
    storage.read('id') == user.id);
    return matchUser;
}