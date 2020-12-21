import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(FoodApp());
}


class FoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DisplayScreen(),
    );
  }
}


class DisplayScreen extends StatefulWidget {
  @override
  _DisplayScreenState createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {

  bool isVeg = true;


  List<FoodItemModel> foodItems = [
    FoodItemModel(
        imagePath: 'asset/chicken-chowmein.jpg',
        itemName: 'Chicken Chowmein',
        itemPrice: '180/-',
    ),
    FoodItemModel(
      imagePath: 'asset/chicken-chowmein.jpg',
      itemName: 'Chicken Chowmein',
      itemPrice: '180/-',
    ),
    FoodItemModel(
      imagePath: 'asset/chicken-chowmein.jpg',
      itemName: 'Chicken Chowmein',
      itemPrice: '180/-',
    ),
    FoodItemModel(
      imagePath: 'asset/chicken-chowmein.jpg',
      itemName: 'Chicken Chowmein',
      itemPrice: '180/-',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                bottom: MediaQuery.of(context).size.height*0.57,
                  left: MediaQuery.of(context).size.width*0.4,
                  child: YellowCircle(color: Colors.yellow[700],),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height*0.57,
                right: MediaQuery.of(context).size.width*0.4,
                child: YellowCircle(color:isVeg?Colors.green[800]:Colors.red),
              ),
              Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50.0,
                    ),
                    Card(
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color:isVeg?Colors.green[800]:Colors.red),
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.menu,
                          color:isVeg?Colors.green[800]:Colors.red,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text('give your tongue a \nlittle twist',style: GoogleFonts.sacramento(
                      fontSize: 55.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      height: 1.0,
                      wordSpacing: 7,
                      letterSpacing: 3.0,
                    ),),
                    /*here goes the genres*/
                    beverageType(),
                    /*here goes the item list*/
                    Expanded(
                      flex: 1,
                      child: ListView(
                        children: foodItems.map((e) => itemDisplayWidget(
                          price: e.itemPrice,
                          imagePath: e.imagePath,
                          name: e.itemName,
                        )).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget beverageType(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){
            setState(() {
              isVeg = true;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: isVeg?Colors.green[800]:Colors.transparent,
              borderRadius: BorderRadius.all(
                  Radius.circular(10.0)
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 2.0,
                horizontal: 18.0,
              ),
              child: Text('veg',style: GoogleFonts.sacramento(
                color: isVeg?Colors.white:Colors.green[800],
                fontSize: 45.0,
                height: 1.0,
              ),),
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            setState(() {
              isVeg = false;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: isVeg?Colors.transparent:Colors.red,
              borderRadius: BorderRadius.all(
                  Radius.circular(10.0)
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 4.0,
                horizontal: 16.0,
              ),
              child: Text('non veg',style: GoogleFonts.sacramento(
                color: isVeg?Colors.redAccent:Colors.white,
                fontSize: 45.0,
                height: 1.0,
              ),),
            ),
          ),
        ),
      ],
    );
  }

  Widget itemDisplayWidget({String imagePath, String name, String price}){
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 6.0,
        vertical: 6.0,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 20.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 100.0,
                width: 120.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                  image: DecorationImage(
                    image: AssetImage(
                      imagePath
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 100.0,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 10.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(name,style: GoogleFonts.sacramento(
                        fontSize: 30.0,
                        height: 1.0,
                      ),),
                      Container(
                        width:MediaQuery.of(context).size.width-150,
                        child: Row(
                          children: [
                            Text('price: '+price,style: GoogleFonts.sacramento(
                              fontSize: 25.0,
                              height: 1.0,
                            )),
                            Spacer(),
                            Container(
                              height: 20.0,
                              width: 20.0,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Text('1',style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,),
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Container(
                              height: 20.0,
                              width: 20.0,
                              decoration: BoxDecoration(
                                color: Colors.green[800],
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Icon(
                              Icons.add_shopping_cart_rounded,
                              size: 20.0,
                              color: Colors.blueGrey,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class YellowCircle extends StatelessWidget {
  final Color color;

  const YellowCircle({Key key, @required this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class DisplayScreenText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var largeTextStyle = TextStyle(
      fontSize: MediaQuery.of(context).size.width * 0.2,
      color: Colors.blueGrey,
    );
    var smallTextStyle = TextStyle(
      fontSize: MediaQuery.of(context).size.width * 0.1,
      color: Colors.blueGrey,
    );

    return RichText(
      text: TextSpan(
          children: [
            TextSpan(
              text: 'Where',
              style: smallTextStyle,
            ),
            TextSpan(
                text: ' t',
                style:largeTextStyle,
                children: [
                  TextSpan(
                    text: 'a',
                    style: largeTextStyle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: 's',
                    style: largeTextStyle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: 't',
                    style: largeTextStyle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: 'e',
                    style: largeTextStyle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ]
            ),
            TextSpan(
              text: ' bring',
              style: smallTextStyle,
            ),
            TextSpan(
                text: ' Tw',
                style: smallTextStyle,
                children: [
                  TextSpan(
                    text: 'ist',
                    style: smallTextStyle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ]
            ),
          ]
      ),
    );
  }
}


class FoodItemModel{
  final String imagePath;
  final String itemName;
  final String itemPrice;

  const FoodItemModel({
    @required this.imagePath,
    @required this.itemName,
    @required this.itemPrice,
  });
}