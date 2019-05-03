import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Place extends StatefulWidget {
  @override
  _PlaceState createState() => _PlaceState();
}

class _PlaceState extends State<Place> {

    Future<void> launchUrl() async {
    const url =
        "https://www.google.com/maps/place/Netaji+Subhash+Engineering+College/@22.4761596,88.4149326,15z/data=!4m12!1m6!3m5!1s0x0:0x276c0d30e6be12ea!2sNetaji+Subhash+Engineering+College!8m2!3d22.4761596!4d88.4149326!3m4!1s0x0:0x276c0d30e6be12ea!8m2!3d22.4761596!4d88.4149326";

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
              child: Container(
          padding: EdgeInsets.fromLTRB(5.0,200.0,5.0,100.0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey,
          child: Center(
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  size:200.0,
                  color:Colors.red
                ),
                Text("Netaji Subhash Engineering College",textAlign: TextAlign.center,style: TextStyle(
                  color: Colors.blueGrey[900],
                  fontSize: 25.0,
                ),)
              ],
            ),
          ),
        ),
        onTap: launchUrl,
      )
    );
  }
}