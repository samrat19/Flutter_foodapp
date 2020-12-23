import 'package:flutter/material.dart';
import 'package:food/logic/model/food_item_model.dart';
import 'package:food/src/food_theme_data.dart';
import 'package:provider/provider.dart';
import '../test_elements.dart';
import 'food_details_widget.dart';

class FoodItemVerticalWidget extends StatefulWidget {
  final FoodItemModel foodItem;

  const FoodItemVerticalWidget({Key key, @required this.foodItem}) : super(key: key);

  @override
  _FoodItemVerticalWidgetState createState() => _FoodItemVerticalWidgetState();
}

class _FoodItemVerticalWidgetState extends State<FoodItemVerticalWidget> {

  int quantity;
  bool isCarted;
  @override
  void initState() {
    quantity = widget.foodItem.quantity;
    isCarted = widget.foodItem.isCarted;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appController = Provider.of<AppController>(context);
    return Card(
      elevation: 20.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              elevation: 15.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: GestureDetector(
                onTap: (){
                  showDialog(
                      context: context,
                      builder: (_) => Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: FoodDetailsWidget(item: widget.foodItem),
                      ),
                  );
                },
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          widget.foodItem.imagePath,
                        )
                    ),
                  ),
                ),
              ),
            ),
            Text(widget.foodItem.itemName,style: FoodThemeData().foodItemTextStyle.copyWith(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),),
            Text(widget.foodItem.itemPrice,style: FoodThemeData().foodItemTextStyle.copyWith(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    if(quantity>1){
                      setState(() {
                        quantity = quantity-1;
                      });
                    }
                  },
                  child: Container(
                    height: 20.0,
                    width: 20.0,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                SizedBox(
                  width: 4.0,
                ),
                Text(quantity.toString(),style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,),
                ),
                SizedBox(
                  width: 4.0,
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      quantity = quantity+1;
                    });
                  },
                  child: Container(
                    height: 20.0,
                    width: 20.0,
                    decoration: BoxDecoration(
                      color: Colors.green[800],
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 4.0,
              ),
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    if(isCarted == false){
                      isCarted = true;
                      appController.addToCart();
                    }else{
                      isCarted = false;
                      appController.removeFromCart();
                    }
                  });
                },
                child: Icon(
                  isCarted?Icons.remove_shopping_cart_rounded:Icons.add_shopping_cart_rounded,
                  size: 20.0,
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}