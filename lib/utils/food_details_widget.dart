import 'package:flutter/material.dart';
import 'package:food/logic/model/food_item_model.dart';
import 'package:food/src/food_theme_data.dart';

import 'background_widget.dart';

class FoodDetailsWidget extends StatelessWidget {

  final FoodItemModel item;

  const FoodDetailsWidget({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Stack(
        children: [
          BackgroundWidget(
            topCircleColor: Colors.yellow[200],
            bottomCircleColor: Colors.blue[200],),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(item.itemName,style: FoodThemeData().foodItemTextStyle.copyWith(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Card(
                      elevation: 20.0,
                      shadowColor: Colors.blue[900],
                      child: Image.asset(item.imagePath),
                    ),
                  ),
                  Text(item.foodDetails,style: FoodThemeData().foodItemTextStyle.copyWith(
                    fontSize: 35.0,
                  ),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
