import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food/components/display_all_food_item.dart';
import 'package:food/test_elements.dart';
import 'package:food/utils/background_widget.dart';
import 'package:food/utils/visible_check_out_widget.dart';
import 'package:provider/provider.dart';

class AllItemsScreen extends StatelessWidget {
  final double height;
  final bool isVeg;

  const AllItemsScreen({Key key, this.height, @required this.isVeg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appController = Provider.of<AppController>(context);
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
                  children: [
                    ...allItems
                        .map((item) => DisplayAllFoodItem(foodItem: item)
                    ).toList(),
                    SizedBox(
                      height: 60.0,
                    ),
                  ]
                ),
              ),
              Positioned(
                top: 10.0,
                left: 5.0,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios_rounded,),
                  iconSize: 30.0,
                  color: Colors.grey[500],
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: appController.cart == 0 ? false:true,
                child: VisibleCheckoutWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
