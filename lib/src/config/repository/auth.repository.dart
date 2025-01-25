

import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthRepository{
  Dio _authDio=Dio();

  AuthRepository(){
    _authDio.options.baseUrl='https://reqres.in/api';
    _authDio.options.connectTimeout=Duration(seconds: 5);
    _authDio.options.receiveTimeout=Duration(seconds: 5);
}

Future<Map<String,dynamic>?> login(String email,String password) async{
   try {
     final response = await _authDio.post(
         '/login',
         data: {
           'email': email,
           'password': password
         }
     );
    if(response.statusCode==200){
      return response.data;
    }
   }catch(e){
     Get.snackbar('خطا', 'مشکل در ورود');
   }
    return null;
}
Future<Map<String,dynamic>?> register(String email,String password)async{
    try{
      final response=await _authDio.post(
          '/register',
        data: {
            'email':email,
          'password':password,
        },
      );
      if(response.statusCode==200||response.statusCode==201){
        return response.data;
      }
    }catch(e){
      Get.snackbar('خطا', ':ثبت نام ناموفق $e');
    }
    return null;
}
}