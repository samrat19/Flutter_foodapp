import 'package:food/auth.dart';
import 'package:food/mycolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String _email, _password, _name;
  Auth auth = Auth();
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  void _submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      _register();
    }
  }

  void _register() async {
    await auth.createUser(_email, _password).then((user) {
     // UserManagement().updateUserInfo(user, _name,
       //   "https://greatzoo.org/media/library/fluid-ext-editor-widget/64/image/AdobeStock_59396481.jpeg?23");
      auth.signOut();
      scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Registered Succesfully"),));
      Navigator.of(context).pop();
    }).catchError((e) {
      print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              Container(
                height: height / 2.5,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [MyColors().color3, MyColors().color4]),
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(90))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Spacer(),
                    Align(
                      alignment: Alignment.center,
                      child: Hero(
                        tag: "PageIcon",
                        child: Icon(
                          Icons.person_add,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(bottom: 30.0, left: 32.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Hero(
                            tag: "PageText",
                            child: Material(
                              color: Colors.transparent,
                              child: Text(
                                "Login",
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
              SingleChildScrollView(
                  child: Container(
                  height: height / 1,
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
                          onSaved: (val) => _name = val,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.person,
                                color: MyColors().color3,
                              ),
                              hintText: "Name"),
                        ),
                      ),
                      Container(
                        width: width / 1.2,
                        height: 48,
                        margin: EdgeInsets.only(top: 40),
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
                                color: MyColors().color3,
                              ),
                              hintText: "Email"),
                        ),
                      ),
                      Container(
                        width: width / 1.2,
                        height: 48,
                        margin: EdgeInsets.only(top: 40.0),
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
                                color: MyColors().color3,
                              ),
                              hintText: "Password"),
                        ),
                      ),
                      Container(
                        height: 40.0,
                        width: width / 1.3,
                        margin: EdgeInsets.only(top: 20.0),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [MyColors().color3, MyColors().color4]),
                            borderRadius: BorderRadius.circular(50.0)),
                        child: Hero(
                          tag: "Action",
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: _submit,
                              child: Center(
                                  child: Text(
                                "REGISTER",
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
                      Spacer()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
