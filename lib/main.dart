import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100.0,
            ),
            /*here goes the genres*/
            beverageType(),
            /*here goes the item list*/
           /* CarouselSlider(
              items: foodItems.map((item) => itemDisplayWidget(
                name: item.itemName,
                imagePath: item.imagePath,
                price: item.itemPrice),
              ).toList(),
              options: CarouselOptions(
                  enableInfiniteScroll: false,
                  initialPage: 0,
                //  autoPlay: true,
                 // pauseAutoPlayOnTouch: true,
                  height:  400.0,
                  enlargeCenterPage: true,
                  viewportFraction: 0.6
              ),
            ),*/
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
                vertical: 4.0,
                horizontal: 18.0,
              ),
              child: Text('veg',style: TextStyle(
                color: isVeg?Colors.white:Colors.green[800],
                fontSize: 30.0,
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
              child: Text('non veg',style: TextStyle(
                color: isVeg?Colors.redAccent:Colors.white,
                fontSize: 30.0,
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
        horizontal: 10.0,
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
                      Text(name,style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),),
                      Text('price: '+price,style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      )),
                    ],
                  ),
                ),
              ),
              Spacer(
                flex: 2,
              ),
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
      ),
    );
  }
}

//top: true,
// child: Stack(
//   fit: StackFit.expand,
//   children: [
//     Positioned(
//       bottom: MediaQuery.of(context).size.height * 0.47,
//       left: MediaQuery.of(context).size.width * 0.4,
//       child: YellowCircle(),
//     ),
//     Padding(
//       padding: const EdgeInsets.only(left: 10.0),
//       child: Column(
//         children: [
//           DisplayScreenText(),
//           SizedBox(
//             height: MediaQuery.of(context).size.height*0.16,
//           ),
//           Container(
//             height: MediaQuery.of(context).size.height*0.4,
//             width: MediaQuery.of(context).size.width,
//             color: Colors.red,
//           ),
//         ],
//       ),
//     ),
//   ],
// ),

class YellowCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.yellow[700],
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