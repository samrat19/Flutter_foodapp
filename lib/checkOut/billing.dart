import 'package:flutter/material.dart';

class Billing extends StatefulWidget {
   
  List<bool> veg;
  List<bool> nonVeg;
  Billing(this.veg,this.nonVeg);
  @override
  _BillingState createState() => _BillingState(this.veg,this.nonVeg);
}

class _BillingState extends State<Billing> {

  List<bool> veg;
  List<bool> nonVeg;
  List<String> vegMenu = ["a","b","c"];
  List<String> nonVegMenu = ["d","e","f"];
  List<int> vegPrice = [40,60,80];
  List<int> nonVegPrice= [40,60,80];
  int total = 0;

  _BillingState(this.veg,this.nonVeg);

  List<String> menu = List();
  @override
  void initState() {
    super.initState();
    for(int i=0;i<vegMenu.length;i++)
    if(veg[i]){
      total += vegPrice[i];
    menu.add("${vegMenu[i]}  ${vegPrice[i]}");}
    for(int i=0;i<nonVegMenu.length;i++)
    if(nonVeg[i]){
      total += nonVegPrice[i];
    menu.add("${nonVegMenu[i]}  ${nonVegPrice[i]}");
  }}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        actions: <Widget>[
          Center(
            child: Text("Total Price : $total \$",style: TextStyle(
              fontSize: 25.0
            ),),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Text("Here is Your Bill"),
            Expanded(
                child: ListView.builder(
                itemCount: menu.length,
                itemBuilder: (_,i){
                  return Text(menu[i]);
                },
              ),
            ),
            Text("Price : $total")
          ],
        ),
      ),
    );
  }
}