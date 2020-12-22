import 'package:flutter/material.dart';
import 'package:food/logic/model/food_item_model.dart';
import 'package:food/logic/model/food_model.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Text(foodItem.genre,style: GoogleFonts.sacramento(
        fontSize: 75.0,
        height: 1.0
    ),);
  }

  Widget foodItems(){
    return ListView(
        scrollDirection: Axis.horizontal,
        children: foodItem.foodItems.map((item) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: FoodItemTicket(foodItem: item),
        ),
        ).toList()
    );
  }
}

class FoodItemTicket extends StatefulWidget {
  final FoodItemModel foodItem;

  const FoodItemTicket({Key key, @required this.foodItem}) : super(key: key);

  @override
  _FoodItemTicketState createState() => _FoodItemTicketState();
}

class _FoodItemTicketState extends State<FoodItemTicket> {

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
            Text(widget.foodItem.itemName,style: GoogleFonts.sacramento(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),),
            Text(widget.foodItem.itemPrice,style: GoogleFonts.sacramento(
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
                    }else{
                      isCarted = false;
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