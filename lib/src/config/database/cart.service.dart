
import 'package:hive/hive.dart';
import 'package:main_project/src/domain/cart/model/cart.model.dart';

class CartService{
  Box<CartModel> getCartModelBox(){
    return Hive.box<CartModel>('carts');
  }
}