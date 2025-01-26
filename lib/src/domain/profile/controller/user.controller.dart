
import 'package:get/get.dart';
import 'package:main_project/src/config/repository/user.repository.dart';
import 'package:main_project/src/domain/profile/model/user.model.dart';

class UserController extends GetxController {
  var isLoading=true.obs;
  var userList=<Data>[].obs;
   UserRepository _userRepository = UserRepository();

   void fetchUser()async{
     isLoading.value=true;
     try{
       final usersData=await _userRepository.singleUser();
       userList.value=usersData.map((e)=>Data.fromJson(e)).toList();
     }catch(e){
       Get.snackbar('خطا', e.toString());
     }
     isLoading.value=false;
   }
}