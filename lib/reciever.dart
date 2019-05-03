import 'package:flutter/material.dart';
import 'package:food/final.dart';

class Reciever extends StatefulWidget {
  @override
  _RecieverState createState() => _RecieverState();
}

class _RecieverState extends State<Reciever> {
  String rname;

  TextEditingController name = TextEditingController();

  void save() {
    rname = name.text;
    print(rname);
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_)=>Invoice(rname))
    );
  }

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
                        controller: name,
                        decoration: InputDecoration(
                            labelText: "Reciever's name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.pinkAccent, width: 2.0))),
                      ),
                      Divider(),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Reciever's Contact Number",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.pinkAccent, width: 2.0))),
                      ),
                      Divider(),
                      Text(
                        "City : Kolkata",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      Divider(),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "Street name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.pinkAccent, width: 2.0))),
                      ),
                      Divider(),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Pincode",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.red, width: 2.0))),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(height: 50.0,),
              Center(
                child: GestureDetector(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    clipBehavior: Clip.hardEdge,
                    child: Container(
                      width: 200.0,
                      height:75.0,
                      color: Colors.red,
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Done",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, 
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0),
                      ),
                    ),
                  ),
                  onTap: save,
                ),
              )
            ],
          )),
    );
  }
}
