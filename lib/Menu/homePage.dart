import 'package:flutter/material.dart';
import 'package:food/aboutus.dart';
import 'package:food/credenTials/signIn.dart';
import 'package:food/feedback.dart';
import 'package:food/place.dart';
import 'package:food/checkOut/billing.dart';
import 'package:food/support.dart';

List<bool> veg = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false
];
List<bool> nonVeg = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false
];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  // void home() {
  //   Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (_) => HomePage());
  // }

  void pageRouter() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => Billing(veg, nonVeg)));
  }

  void support() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => Support()));
  }

  void launchLocation() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => Place()));
  }

  void about() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => Aboutus()));
  }

  void feedback() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => FeedBack()));
  }

  void logout() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              accountName: Text("Foodie"),
              accountEmail: Text("foodie@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "Foodie",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
              )),
          Divider(),
          ListTile(
            onTap: launchLocation,
            leading: Icon(
              Icons.location_on,
              size: 35.0,
              color: Colors.red,
            ),
            title: Text(
              "Our Location",
              style: TextStyle(fontSize: 25.0, color: Colors.blue[900]),
            ),
          ),
          Divider(),
          ListTile(
            onTap: about,
            leading:
                Icon(Icons.local_offer, size: 35.0, color: Colors.green[900]),
            title: Text(
              "About US",
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.red[800],
              ),
            ),
          ),
          Divider(),
          ListTile(
            onTap: support,
            leading:
                Icon(Icons.child_care, size: 35.0, color: Colors.yellow[600]),
            title: Text(
              "Support",
              style: TextStyle(color: Colors.green[800], fontSize: 25.0),
            ),
          ),
          ListTile(
            onTap: feedback,
            leading: Icon(Icons.public, size: 35.0, color: Colors.blue[800]),
            title: Text(
              "Feedback",
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.red[800],
              ),
            ),
          ),
          ListTile(
            onTap: logout,
            leading: Icon(Icons.power_settings_new,
                size: 35.0, color: Colors.red[800]),
            title: Text(
              "Log Out",
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.blue[900],
              ),
            ),
          ),
        ],
      )),
      appBar: AppBar(
        title: Text(
          "Foodie",
          style: TextStyle(fontSize: 25.0),
        ),
        backgroundColor: Colors.red,
        bottom: TabBar(
          controller: tabController,
          tabs: <Tab>[
            Tab(
              text: "Veg",
            ),
            Tab(
              text: "NonVeg",
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          Veg(),
          NonVeg(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: pageRouter,
        child: Icon(Icons.add),
      ),
    );
  }
}

class Veg extends StatefulWidget {
  @override
  _VegState createState() => _VegState();
}

class _VegState extends State<Veg> {
  bool checkBoxstate = false;
  List<String> vegItems = [
    "asset/veg-sandwich.jpg",
    "asset/chowmein.jpg",
    "asset/paneer.jpg",
    "asset/alur-dom.jpg",
    "asset/vegetable_Fried_Rice.jpg",
    "asset/jeera-Rice.jpg",
    "asset/dal-makhani.jpg",
    "asset/chanar-kofta.jpg",
    "asset/alu-biriyani.jpg",
    "asset/vegetable-Pasta.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(15.0),
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                    height: 150.0,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      vegItems[0],
                      fit: BoxFit.fill,
                    )),
                Row(
                  children: <Widget>[
                    Text(
                      " Veg Sandwich 40Rs.",
                      style: TextStyle(color: Colors.blue, fontSize: 20.0),
                    ),
                    Checkbox(
                      value: veg[0],
                      onChanged: (val) {
                        setState(() {
                          veg[0] = val;
                        });
                      },
                      checkColor: Colors.amber,
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                        height: 150.0,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          vegItems[1],
                          fit: BoxFit.fill,
                        )),
                    Row(
                      children: <Widget>[
                        Text(
                          " Veg Chowmin 70Rs",
                          style: TextStyle(color: Colors.blue, fontSize: 20.0),
                        ),
                        Checkbox(
                          value: veg[1],
                          onChanged: (val) {
                            setState(() {
                              veg[1] = val;
                            });
                          },
                          checkColor: Colors.amber,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                    height: 150.0,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      vegItems[2],
                      fit: BoxFit.fill,
                    )),
                Row(
                  children: <Widget>[
                    Text(
                      "Panner Butter Masala 110Rs",
                      style: TextStyle(color: Colors.blue, fontSize: 20.0),
                    ),
                    Checkbox(
                      value: veg[2],
                      checkColor: Colors.amber,
                      onChanged: (val) {
                        setState(() {
                          veg[2] = val;
                        });
                      },
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                    height: 150.0,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      vegItems[3],
                      fit: BoxFit.fill,
                    )),
                Row(
                  children: <Widget>[
                    Text(
                      " Alur Dom(4pcs) 40Rs",
                      style: TextStyle(color: Colors.blue, fontSize: 20.0),
                    ),
                    Checkbox(
                      value: veg[3],
                      checkColor: Colors.amber,
                      onChanged: (val) {
                        setState(() {
                          veg[3] = val;
                        });
                      },
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                    height: 150.0,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      vegItems[4],
                      fit: BoxFit.fill,
                    )),
                Row(
                  children: <Widget>[
                    Text(
                      " Veg FriedRice 140Rs",
                      style: TextStyle(color: Colors.blue, fontSize: 20.0),
                    ),
                    Checkbox(
                      value: veg[4],
                      checkColor: Colors.amber,
                      onChanged: (val) {
                        setState(() {
                          veg[4] = val;
                        });
                      },
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                    height: 150.0,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      vegItems[5],
                      fit: BoxFit.fill,
                    )),
                Row(
                  children: <Widget>[
                    Text(
                      "Jeera Rice 120Rs",
                      style: TextStyle(color: Colors.blue, fontSize: 20.0),
                    ),
                    Checkbox(
                      value: veg[5],
                      checkColor: Colors.amber,
                      onChanged: (val) {
                        setState(() {
                          veg[5] = val;
                        });
                      },
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                    height: 150.0,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      vegItems[6],
                      fit: BoxFit.fill,
                    )),
                Row(
                  children: <Widget>[
                    Text(
                      " Dal Makhani 50Rs",
                      style: TextStyle(color: Colors.blue, fontSize: 20.0),
                    ),
                    Checkbox(
                      value: veg[6],
                      checkColor: Colors.amber,
                      onChanged: (val) {
                        setState(() {
                          veg[6] = val;
                        });
                      },
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                    height: 150.0,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      vegItems[7],
                      fit: BoxFit.fill,
                    )),
                Row(
                  children: <Widget>[
                    Text(
                      " Chhanar Kofta(8 Pcs) 160Rs",
                      style: TextStyle(color: Colors.blue, fontSize: 20.0),
                    ),
                    Checkbox(
                      value: veg[7],
                      checkColor: Colors.amber,
                      onChanged: (val) {
                        setState(() {
                          veg[7] = val;
                        });
                      },
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                    height: 150.0,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      vegItems[8],
                      fit: BoxFit.fill,
                    )),
                Row(
                  children: <Widget>[
                    Text(
                      " Veg Biriyani 150Rs",
                      style: TextStyle(color: Colors.blue, fontSize: 20.0),
                    ),
                    Checkbox(
                      value: veg[8],
                      checkColor: Colors.amber,
                      onChanged: (val) {
                        setState(() {
                          veg[8] = val;
                        });
                      },
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                    height: 150.0,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      vegItems[9],
                      fit: BoxFit.fill,
                    )),
                Row(
                  children: <Widget>[
                    Text(
                      " Veg Pasta 50Rs",
                      style: TextStyle(color: Colors.blue, fontSize: 20.0),
                    ),
                    Checkbox(
                      value: veg[9],
                      checkColor: Colors.amber,
                      onChanged: (val) {
                        setState(() {
                          veg[9] = val;
                        });
                      },
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NonVeg extends StatefulWidget {
  @override
  _NonVegState createState() => _NonVegState();
}

class _NonVegState extends State<NonVeg> {
  bool checkBoxstate = false;

  List<String> nonvegItems = [
    "asset/chicken-sandwich.jpg",
    "asset/chicken-chowmein.jpg",
    "asset/chilli-chicken.jpg",
    "asset/chicken-fried-rice.jpg",
    "asset/egg_Curry.jpg",
    "asset/mixed-fried-rice.jpg",
    "asset/chicken-bharata.jpg",
    "asset/chicken-tandori.jpg",
    "asset/chicken-Biryani.jpg",
    "asset/mutton-biryani.jpg",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(15.0),
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                    height: 150.0,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      nonvegItems[0],
                      fit: BoxFit.fill,
                    )),
                Row(
                  children: <Widget>[
                    Text(
                      " Chicken Sandwich 50Rs.",
                      style: TextStyle(color: Colors.blue, fontSize: 20.0),
                    ),
                    Checkbox(
                      value: nonVeg[0],
                      onChanged: (val) {
                        setState(() {
                          nonVeg[0] = val;
                        });
                      },
                      checkColor: Colors.amber,
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                    height: 150.0,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      nonvegItems[1],
                      fit: BoxFit.fill,
                    )),
                Row(
                  children: <Widget>[
                    Text(
                      " Chicken Chowmin 120Rs",
                      style: TextStyle(color: Colors.blue, fontSize: 20.0),
                    ),
                    Checkbox(
                      value: nonVeg[1],
                      onChanged: (val) {
                        setState(() {
                          nonVeg[1] = val;
                        });
                      },
                      checkColor: Colors.amber,
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                    height: 150.0,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      nonvegItems[2],
                      fit: BoxFit.fill,
                    )),
                Row(
                  children: <Widget>[
                    Text(
                      " Chili Chicken(8 Pcs,) 160Rs",
                      style: TextStyle(color: Colors.blue, fontSize: 20.0),
                    ),
                    Checkbox(
                      value: nonVeg[2],
                      checkColor: Colors.amber,
                      onChanged: (val) {
                        setState(() {
                          nonVeg[2] = val;
                        });
                      },
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                    height: 150.0,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      nonvegItems[3],
                      fit: BoxFit.fill,
                    )),
                Row(
                  children: <Widget>[
                    Text(
                      " Chicken FriedRice 160Rs",
                      style: TextStyle(color: Colors.blue, fontSize: 20.0),
                    ),
                    Checkbox(
                      value: nonVeg[3],
                      checkColor: Colors.amber,
                      onChanged: (val) {
                        setState(() {
                          nonVeg[3] = val;
                        });
                      },
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                    height: 150.0,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      nonvegItems[4],
                      fit: BoxFit.fill,
                    )),
                Row(
                  children: <Widget>[
                    Text(
                      " Egg Curry(2 Pcs.) 40Rs",
                      style: TextStyle(color: Colors.blue, fontSize: 20.0),
                    ),
                    Checkbox(
                      value: nonVeg[4],
                      checkColor: Colors.amber,
                      onChanged: (val) {
                        setState(() {
                          nonVeg[4] = val;
                        });
                      },
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                    height: 150.0,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      nonvegItems[5],
                      fit: BoxFit.fill,
                    )),
                Row(
                  children: <Widget>[
                    Text(
                      " Mixed Fried Rice 190Rs",
                      style: TextStyle(color: Colors.blue, fontSize: 20.0),
                    ),
                    Checkbox(
                      value: nonVeg[5],
                      checkColor: Colors.amber,
                      onChanged: (val) {
                        setState(() {
                          nonVeg[5] = val;
                        });
                      },
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                    height: 150.0,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      nonvegItems[6],
                      fit: BoxFit.fill,
                    )),
                Row(
                  children: <Widget>[
                    Text(
                      " Chicken Bhorta 100Rs",
                      style: TextStyle(color: Colors.blue, fontSize: 20.0),
                    ),
                    Checkbox(
                      value: nonVeg[6],
                      checkColor: Colors.amber,
                      onChanged: (val) {
                        setState(() {
                          nonVeg[6] = val;
                        });
                      },
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                    height: 150.0,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      nonvegItems[7],
                      fit: BoxFit.fill,
                    )),
                Row(
                  children: <Widget>[
                    Text(
                      "Tandoori Chicken(4 Pcs) 160Rs",
                      style: TextStyle(color: Colors.blue, fontSize: 20.0),
                    ),
                    Checkbox(
                      value: nonVeg[7],
                      checkColor: Colors.amber,
                      onChanged: (val) {
                        setState(() {
                          nonVeg[7] = val;
                        });
                      },
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                    height: 150.0,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      nonvegItems[8],
                      fit: BoxFit.fill,
                    )),
                Row(
                  children: <Widget>[
                    Text(
                      " Chicken Biriyni 175Rs",
                      style: TextStyle(color: Colors.blue, fontSize: 20.0),
                    ),
                    Checkbox(
                      value: nonVeg[8],
                      checkColor: Colors.amber,
                      onChanged: (val) {
                        setState(() {
                          nonVeg[8] = val;
                        });
                      },
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                    height: 150.0,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      nonvegItems[9],
                      fit: BoxFit.fill,
                    )),
                Row(
                  children: <Widget>[
                    Text(
                      " Mutton Biryani 200Rs",
                      style: TextStyle(color: Colors.blue, fontSize: 20.0),
                    ),
                    Checkbox(
                      value: nonVeg[9],
                      checkColor: Colors.amber,
                      onChanged: (val) {
                        setState(() {
                          nonVeg[9] = val;
                        });
                      },
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
