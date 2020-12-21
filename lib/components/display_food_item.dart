import 'package:flutter/material.dart';
import 'package:food/logic/model/food_item_model.dart';
import 'package:google_fonts/google_fonts.dart';

class DisplayFoodItem extends StatelessWidget {

  final FoodItemModel foodItem;

  const DisplayFoodItem({Key key, @required this.foodItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 6.0,
        vertical: 6.0,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 20.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 100.0,
                width: 120.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                  image: DecorationImage(
                    image: AssetImage(
                        foodItem.imagePath,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 100.0,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 10.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(foodItem.itemName,style: GoogleFonts.sacramento(
                        fontSize: 30.0,
                        height: 1.0,
                      ),),
                      Container(
                        width:MediaQuery.of(context).size.width-150,
                        child: Row(
                          children: [
                            Text('price: '+foodItem.itemPrice,style: GoogleFonts.sacramento(
                              fontSize: 25.0,
                              height: 1.0,
                            )),
                            Spacer(),
                            Container(
                              height: 20.0,
                              width: 20.0,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Text('1',style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,),
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Container(
                              height: 20.0,
                              width: 20.0,
                              decoration: BoxDecoration(
                                color: Colors.green[800],
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Icon(
                              Icons.add_shopping_cart_rounded,
                              size: 20.0,
                              color: Colors.blueGrey,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
