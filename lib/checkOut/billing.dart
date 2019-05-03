import 'package:flutter/material.dart';
import 'package:food/final.dart';
import 'package:food/reciever.dart';

class Billing extends StatefulWidget {
  List<bool> veg;
  List<bool> nonVeg;
  Billing(this.veg, this.nonVeg);
  @override
  _BillingState createState() => _BillingState(this.veg, this.nonVeg);
}

class _BillingState extends State<Billing> {
  List<bool> veg;
  List<bool> nonVeg;

  List<String> vegMenu = [
    "Veg Sandwich",
    "Veg Chowmin",
    "Panneer Butter Masala",
    "Alur Dom (4Pcs)",
    "Veg Fried Rice",
    "Jeera Rice",
    "Dal Makhani",
    "Chhanar Kofta 8pcs",
    "Veg Biriyani",
    "Veg Pasta"
  ];
  List<String> nonVegMenu = [
    "Chicken Sandwich",
    "Chicken Chowmin",
    "Chili Chicken (8 Pcs)",
    "Chicken Fried Rice"
    "Egg Curry(2 Pcs.)"
    "Mixed Fried Rice",
    "Chicken Bhorta",
    "Tandoori Chicken (4 Pcs)",
    "Chicken Biryani",
    "Mutton Biryani"
  ];
  List<int> vegPrice = [40, 70, 110,40,140,120,50,160,150,50];
  List<int> nonVegPrice = [50, 120, 160,160,40,190,100,160,175,200];
  int total = 0;

  _BillingState(this.veg, this.nonVeg);

  List<String> menu = List();
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < vegMenu.length; i++)
      if (veg[i]) {
        total += vegPrice[i];
        menu.add("${vegMenu[i]}  ${vegPrice[i]}");
      }
    for (int i = 0; i < nonVegMenu.length; i++)
      if (nonVeg[i]) {
        total += nonVegPrice[i];
        menu.add("${nonVegMenu[i]}  ${nonVegPrice[i]}");
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        actions: <Widget>[
          Center(
            child: Text(
              "Total Price : $total Rs.",
              style: TextStyle(fontSize: 25.0),
            ),
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset("asset/food.jpg",fit: BoxFit.cover,),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Divider(height: 30.0),
                Container(
                  height: 300.0,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(20.0),
                    itemCount: menu.length,
                    itemBuilder: (_, i) {
                      return Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            menu[i],
                            style:
                                TextStyle(
                                  color: Colors.brown,
                                  fontSize: 25.0),
                          ));
                    },
                  ),
                ),
                Divider(
                  height: 30.0,
                ),
                GestureDetector(
                  child: Container(
                    height: 80.0,

                    width: 350.0,

                    padding: EdgeInsets.all(20.0),

                    color: Colors.brown,

                    child: Text(
                      "Procced With Cash On Delivery",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0,
                       color: Colors.white),
                    ),
                  ),
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_)=>Reciever())
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
