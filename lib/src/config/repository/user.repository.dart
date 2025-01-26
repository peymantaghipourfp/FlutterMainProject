

import 'package:dio/dio.dart';
import 'package:get/get.dart';

class UserRepository {
  Dio _userDio = Dio();

  UserRepository() {
    _userDio.options.baseUrl = 'https://reqres.in/api';
    _userDio.options.connectTimeout = Duration(seconds: 5);
    _userDio.options.receiveTimeout = Duration(seconds: 5);
  }

  Future<List<dynamic>> singleUser() async{
    try{
      final response=await _userDio.get('/users');
      return response.data['data'];
    }catch(e){
      rethrow;
    }
  }
}