import 'package:flutter/cupertino.dart';
import 'package:food/logic/model/food_item_model.dart';

class FoodModel{
  final String genre;
  final List<FoodItemModel> foodItems;

  FoodModel({@required this.genre, @required this.foodItems});
}