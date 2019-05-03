import 'package:flutter/material.dart';
import 'package:food/Menu/homePage.dart';

class FeedBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Delivery Details"),
      ),
      body: Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20.0),
                child: Form(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "Your Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.pinkAccent, width: 2.0))),
                      ),
                      Divider(),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "Food Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.pinkAccent, width: 2.0))),
                      ),
                      Divider(),
                      Divider(),
                      TextFormField(
                        keyboardType: TextInputType.numberWithOptions(signed: true,decimal: true),
                        decoration: InputDecoration(
                            labelText: "Rating",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.pinkAccent, width: 2.0))),
                      ),
                      Divider(),
                      Divider(),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 50.0,
              ),
              Center(
                child: GestureDetector(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    clipBehavior: Clip.hardEdge,
                    child: Container(
                      width: 200.0,
                      height: 75.0,
                      color: Colors.red,
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Done",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => HomePage()));
                  },
                ),
              )
            ],
          )),
    );
  }
}
