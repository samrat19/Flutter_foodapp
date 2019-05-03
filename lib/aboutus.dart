import 'package:flutter/material.dart';

class Aboutus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("About Foodie"),
      ),
      body: Material(
        color: Colors.orange,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(40.0),
          child: ListView(
            children: <Widget>[
              Divider(
                height: 100.0,
              ),
              Text(
                "Welcome to our app!\n\n"
                "We serve our customers online. Currently we only support cash on delivery as payment mode."
                "We would like to upgrade many of our features in the near future. We would appreciate an honest feedback from our users.",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
