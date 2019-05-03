import 'package:flutter/material.dart';

class Invoice extends StatelessWidget {
  String name;
  Invoice(this.name);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit:StackFit.expand,
        children: <Widget>[
          Image.asset("asset/wall.jpg",fit:BoxFit.cover),
          Center(
            child: Column(
              children: <Widget>[
                Divider(
                  height: 100.0,
                ),
                Icon(
                  Icons.alarm,size: 200.0,color: Colors.white,
                ),
                Divider(height: 50.0,),
                Text(
                  "Dear ${this.name},",
                  textAlign: TextAlign.start,
                  style:
                      TextStyle(fontSize: 25.0, color: Colors.white),
                ),
                Text("Your food will be delivered with in 1 hour, please wait.",
                textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 25.0, color: Colors.white),),
                Divider(
                  height: 100.0,
                ),
                Center(
                  child: Text(
                    "Thanks For Choosing Us, Have a nice Day",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 25.0, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
