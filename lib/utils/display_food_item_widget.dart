import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/logic/model/food_item_model.dart';
import 'package:food/test_elements.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'food_details_widget.dart';

class DisplayFoodItemWidget extends StatefulWidget {

  final FoodItemModel foodItem;

  const DisplayFoodItemWidget({Key key, @required this.foodItem}) : super(key: key);

  @override
  _DisplayFoodItemWidgetState createState() => _DisplayFoodItemWidgetState();
}

class _DisplayFoodItemWidgetState extends State<DisplayFoodItemWidget> {

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
              GestureDetector(
                onTap: (){
                  showDialog(
                    context: context,
                    builder: (_) => Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: FoodDetailsWidget(item: widget.foodItem),
                    )
                  );
                },
                child: Container(
                  height: 100.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                    image: DecorationImage(
                      image: AssetImage(
                          widget.foodItem.imagePath,
                      ),
                      fit: BoxFit.cover,
                    ),
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
                      Text(widget.foodItem.itemName,style: GoogleFonts.sacramento(
                        fontSize: 30.0,
                        height: 1.0,
                      ),),
                      Container(
                        width:MediaQuery.of(context).size.width-150,
                        child: Row(
                          children: [
                            Text('price: '+widget.foodItem.itemPrice,style: GoogleFonts.sacramento(
                              fontSize: 25.0,
                              height: 1.0,
                            )),
                            Spacer(),
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
                            SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
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
