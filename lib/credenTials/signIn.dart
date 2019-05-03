import 'package:food/Menu/homepage.dart';
import 'package:food/credentials/signUp.dart';
import 'package:food/auth.dart';
import 'package:food/mycolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  Auth auth = Auth();
  String _email, _password;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  void _submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      _login();
    }
  }

  void _login() async {
    await auth.signIn(_email, _password).then((user) {
      print(user.email);
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              Container(
                height: height / 2.5,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [MyColors().color1, MyColors().color2]),
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(90))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Spacer(),
                    Align(
                      alignment: Alignment.center,
                      child: Hero(
                        tag: "PageIcon",
                        child: Icon(
                          MdiIcons.login,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(bottom: 30.0, right: 32.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => RegistrationPage()));
                          },
                          child: Hero(
                            tag: "PageText",
                            child: Material(
                              color: Colors.transparent,
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: height / 1.7,
                padding: EdgeInsets.only(top: 50.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: width / 1.2,
                      height: 48,
                      padding: EdgeInsets.only(
                          left: 10.0, right: 10.0, bottom: 2.0, top: 2.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 5,
                            )
                          ]),
                      child: TextFormField(
                        onSaved: (value) => _email = value,
                        validator: (val) =>
                            !val.contains('@') ? "Invalid Email" : null,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.email,
                              color: MyColors().color1,
                            ),
                            hintText: "Email"),
                      ),
                    ),
                    Container(
                      width: width / 1.2,
                      height: 48,
                      margin: EdgeInsets.only(top: 60.0),
                      padding: EdgeInsets.only(
                          left: 10.0, right: 10.0, bottom: 2.0, top: 2.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 5,
                            )
                          ]),
                      child: TextFormField(
                        onSaved: (value) => _password = value,
                        validator: (val) =>
                            val.length < 6 ? "Password too short" : null,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.vpn_key,
                              color: MyColors().color1,
                            ),
                            hintText: "Password"),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12.0, right: 33.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Forgot Password ?",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15.0,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 40.0,
                      width: width / 1.3,
                      margin: EdgeInsets.only(top: 20.0),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [MyColors().color1, MyColors().color2]),
                          borderRadius: BorderRadius.circular(50.0)),
                      child: Hero(
                        tag: "Action",
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: _submit,
                            child: Center(
                                child: Text(
                              "LOGIN",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () async {
                        await auth.googleSignIn().then((user) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (_) => HomePage()));
                        });
                      },
                      icon: Icon(
                        MdiIcons.google,
                        color: Colors.blue,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
