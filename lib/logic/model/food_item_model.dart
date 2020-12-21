import 'package:flutter/material.dart';

class FoodItemModel{
  final String imagePath;
  final String itemName;
  final String itemPrice;

  const FoodItemModel({
    @required this.imagePath,
    @required this.itemName,
    @required this.itemPrice,
  });
}