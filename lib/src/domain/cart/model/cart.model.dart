
import 'package:hive/hive.dart';
part 'cart.model.g.dart';
@HiveType(typeId:0)
class CartModel{
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String image;

  @HiveField(3)
  final double price;

  CartModel({required this.id, required this.title, required this.image, required this.price});

}