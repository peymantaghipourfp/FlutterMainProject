

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:main_project/src/domain/product/model/product_list.model.dart';

class ProductListRepository{
  Dio _productListDio=Dio();

  ProductListRepository(){
    _productListDio.options.baseUrl="https://fakestoreapi.com";
    _productListDio.options.connectTimeout=Duration(seconds: 3);
    _productListDio.options.receiveTimeout=Duration(seconds: 5);
  }

  Future<List<ProductListModel>> getProductList()async{
    try{
      final response= await _productListDio.get('/products');
      if(response.statusCode==200){
        List<dynamic> data= response.data;
        return data.map((product)=>ProductListModel.fromJson(product)).toList();
      }else{
        throw Exception('خطایی رخ داده است');
      }
    }catch(e){
      rethrow;
    }
  }
}