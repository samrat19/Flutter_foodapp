import 'package:flutter/material.dart';

import 'package:food/checkOut/billing.dart';

List<bool> veg = [false, false, false];
List<bool> nonVeg = [false, false, false];

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

  void pageRouter() {
    Navigator.of(context)
    .push(MaterialPageRoute(builder: (_) =>
     Billing(veg,nonVeg))
    );}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "Rooti 3pcs and Paneer 40Rs",
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
            Row(
              children: <Widget>[
                Text(
                  "Rooti 3pcs and Paneer 40Rs",
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
            Row(
              children: <Widget>[
                Text(
                  "Rooti 3pcs and Paneer 40Rs",
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "Rooti 3pcs and Paneer 40Rs",
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
            Row(
              children: <Widget>[
                Text(
                  "Rooti 3pcs and Chicekn 60Rs",
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
            Row(
              children: <Widget>[
                Text(
                  "Rooti 3pcs and Paneer 40Rs",
                  style: TextStyle(color: Colors.blue, fontSize: 20.0),
                ),
                Checkbox(
                  value: nonVeg[2],
                  onChanged: (val) {
                    setState(() {
                      nonVeg[2] = val;
                    });
                  },
                  checkColor: Colors.amber,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
