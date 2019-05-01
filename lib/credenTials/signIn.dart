import 'package:flutter/material.dart';
import 'package:food/Menu/homePage.dart';
import 'package:food/credenTials/signUp.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void handleSummit() {
    //  final FormState formState = formkey.currentState;

    // if (formState.validate()) {
    //   formState.save();
    // }

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) => HomePage()));
  }

    void handleSummit1() {
    //  final FormState formState = formkey.currentState;

    // if (formState.validate()) {
    //   formState.save();
    // }

    Navigator.of(context)
        .push(MaterialPageRoute(
          builder: (BuildContext context) => SignUp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
              padding: EdgeInsets.all(10.0),
              child: Form(
                autovalidate: true,
                key: formkey,
                child: Column(
                  children: <Widget>[
                    Divider(
                      height: 20.0,
                    ),
                    Divider(),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Phone number",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: Colors.pinkAccent, width: 2.0))),
                      // onSaved: (val) => item.title = val,
                      validator: (val) => val == "" ? val : null,
                    ),
                    Divider(),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: Colors.redAccent, width: 2.0))),
                      // onSaved: (val) => item.guardian_title = val,
                      validator: (val) => val == "" ? val : null,
                    ),
                    Divider(),
                    Divider(),
                    GestureDetector(
                      child: GoToMenu(),
                      onTap: () {
                        handleSummit();
                      },
                    ),
                    GestureDetector(
                      child: UserCreation(),
                      onTap: () {
                        handleSummit1();
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ],
    ));
  }
}

class GoToMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.0),
      child: Text("Go To Menu"),
    );
  }
}

class UserCreation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "New User?SignUp",
      style: TextStyle(
        fontSize: 25.0,
      ),
    );
  }
}

