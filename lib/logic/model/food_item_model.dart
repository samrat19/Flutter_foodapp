import 'package:flutter/material.dart';

class FoodItemModel{
  final int id;
  final String imagePath;
  final String itemName;
  final String itemPrice;
  final int quantity;
  final bool isCarted;

  const FoodItemModel({
    @required this.id,
    @required this.imagePath,
    @required this.itemName,
    @required this.itemPrice,
    @required this.quantity,
    @required this.isCarted,
  });
}