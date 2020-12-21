import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food/components/background_widget.dart';
import 'package:food/components/display_all_food_item.dart';
import 'package:food/test_elements.dart';

class AllItemsScreen extends StatelessWidget {
  final double height;
  final bool isVeg;

  const AllItemsScreen({Key key, this.height, @required this.isVeg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: height,
        color: Colors.white,
        child: Container(
          height: height,
          child: Stack(
            children: [
              BackgroundWidget(
                topCircleColor: Colors.yellow[700],
                bottomCircleColor: isVeg ? Colors.green[800] : Colors.red,
              ),
              Container(
                height: height,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  children: allItems
                      .map((item) => DisplayAllFoodItem(foodItem: item)
                  ).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
