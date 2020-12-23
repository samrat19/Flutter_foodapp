import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/src/food_theme_data.dart';

class VisibleCheckoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Card(
          color: Colors.blue[200],
          elevation: 20.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0,left: 4.0,right: 4.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Checkout',style:FoodThemeData().foodItemTextStyle.copyWith(
                  fontSize: 40.0,
                  color: Colors.white,
                ),),
                Icon(Icons.arrow_forward_ios_rounded,size: 30.0,color: Colors.white,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}