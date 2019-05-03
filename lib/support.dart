import 'package:flutter/material.dart';

class Support extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Support"),
      ),
      body: Center(
        child: Container(
          color: Colors.blueGrey[200],
          child: Column(
            children: <Widget>[
              Divider(height: 50.0,),
              Icon(Icons.contact_mail,size: 150.0,color: Colors.blue,),
              Divider(height: 80.0,),
              Text("For any kind of support call us on : 9593226825 or email us: foodie@gmail.com",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
                fontSize: 30.0
              ),)
            ],
          ),
        ),
      ),
    );
  }
}