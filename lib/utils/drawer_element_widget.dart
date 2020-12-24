import 'package:flutter/material.dart';
import 'package:food/logic/model/drawer_element_model.dart';
import 'package:food/screen/today_special_screen.dart';
import 'package:food/src/food_theme_data.dart';
import 'package:food/utils/bouncy_page_route.dart';

class DrawerElementWidget extends StatelessWidget {

  final DrawerElementModel element;

  const DrawerElementWidget({Key key, @required this.element}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, BouncyPageRoute(child: element.child,alignment: element.alignment));
      },
      child: Hero(
        tag: element.name,
        child: Card(
          color: Colors.transparent,
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: element.color.withOpacity(0.6),
            ),
            child: Center(
              child: Text(element.name,style: FoodThemeData().foodItemTextStyle.copyWith(
                color: Colors.white,
                fontSize: element.name.length>7?32.0:40.0,
              ),),
            ),
          ),
        ),
      ),
    );
  }
}