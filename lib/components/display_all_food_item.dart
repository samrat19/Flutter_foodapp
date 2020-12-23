import 'package:flutter/material.dart';
import 'package:food/logic/model/food_model.dart';
import 'package:food/src/food_theme_data.dart';
import 'package:food/utils/food_item_vertical_widget.dart';

class DisplayAllFoodItem extends StatelessWidget {

  final FoodModel foodItem;

  const DisplayAllFoodItem({Key key, @required this.foodItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 320.0,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            foodItemGenre(),
            Expanded(
              child: foodItems(),
            ),
          ],
        ),
      ),
    );
  }

  Widget foodItemGenre(){
    return Text(foodItem.genre,style: FoodThemeData().foodItemTextStyle.copyWith(
      fontSize: 75.0,
    ),);
  }

  Widget foodItems(){
    return ListView(
        scrollDirection: Axis.horizontal,
        children: foodItem.foodItems.map((item) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: FoodItemVerticalWidget(foodItem: item),
        ),
        ).toList()
    );
  }
}