import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:food/components/menu_button_widget.dart';
import 'package:food/screen/all_items_screen.dart';
import 'package:food/utils/background_widget.dart';
import 'package:food/utils/caption_text_widget.dart';
import 'package:food/utils/display_food_item_widget.dart';
import 'package:food/utils/visible_check_out_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../test_elements.dart';

class TodaySpecialScreen extends StatefulWidget {
  @override
  _TodaySpecialScreenState createState() => _TodaySpecialScreenState();
}

class _TodaySpecialScreenState extends State<TodaySpecialScreen> {

  ScrollController scrollController;

  bool isVeg = true;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState(){
    scrollController = ScrollController(initialScrollOffset: 0.0);
    super.initState();
  }

  bool scrolling = false;

  @override
  Widget build(BuildContext context) {

    final appController = Provider.of<AppController>(context);

    return Scaffold(
      key: scaffoldKey,
      drawerScrimColor: Colors.white,
      endDrawer: Stack(
      //  color: Colors.black.withOpacity(0.5),
        children: [
          BackgroundWidget(
            topCircleColor: Colors.yellow[700],
            bottomCircleColor: Colors.grey[300],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...drawerItems.map((item) => DrawerElementWidget(element: item),).toList(),
              ],
            ),
          ),
          Positioned(
            top: 40.0,
            left: 10.0,
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 30.0,
                        color: Colors.grey[700],
                      ),
                    Text('Back',style: GoogleFonts.sacramento(fontSize: 30.0,height: 2),)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          fit: StackFit.expand,
          children: [
            BackgroundWidget(
              topCircleColor: Colors.yellow[700],
              bottomCircleColor: isVeg?Colors.green[800]:Colors.red,
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
                  GestureDetector(
                    onTap: (){
                      scaffoldKey.currentState.openEndDrawer();
                    },
                    child: MenuButtonWidget(
                      color: isVeg?Colors.green[800]:Colors.red,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CaptionTextWidget(
                    text: 'give your tongue a \nlittle twist',
                  ),
                  /*here goes the genres*/
                  beverageType(),
                  SizedBox(height: 20.0,),
                  Text('Today\'s Special :',style: GoogleFonts.sacramento(
                    height: 1.0,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                    color: isVeg?Colors.teal:Colors.redAccent,
                  ),),
                  SizedBox(
                    height: 15.0,
                  ),
                  /*here goes the item list*/
                  Expanded(
                    flex: 1,
                    child: NotificationListener(
                      child: ListView(
                        controller: scrollController,
                        padding: EdgeInsets.only(top:0.0),
                        physics: BouncingScrollPhysics(),
                        children: foodItems.map((foodItem) => DisplayFoodItemWidget(foodItem: foodItem)).toList(),
                      ),
                      onNotification: (ScrollNotification event){
                        setState(() {
                          scrolling = scrollController.position.activity.isScrolling;
                        });
                        return scrolling;
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 700),
                      opacity: scrolling ? 0.0 : 1.0,
                      child: GestureDetector(
                        onTap: displayAllFood,
                        child: Icon(Icons.keyboard_arrow_up_sharp,color: Colors.grey[200],
                        size: 60.0,),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Visibility(
              visible: appController.cart == 0 ? false:true,
              child: VisibleCheckoutWidget(),
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

  displayAllFood(){
    showModalBottomSheet<dynamic>(
        backgroundColor: Colors.transparent,
        barrierColor: Colors.transparent,
        isScrollControlled: true,
        elevation: 0.0,
        context: context,
        builder: (context){
          double height = MediaQuery.of(context).size.height;
          return AllItemsScreen(isVeg: isVeg,height: height,);
        }
    );
  }
}

class DrawerElementWidget extends StatelessWidget {

  final DrawerElementModel element;

  const DrawerElementWidget({Key key, @required this.element}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(element.name, style: GoogleFonts.sacramento(
        fontSize: 50.0,
        height: 1,
        color: element.color,
      ),),
    );
  }
}

class DrawerElementModel{
  final String name;
  final Color color;

  const DrawerElementModel({@required this.name, @required this.color});
}

List<DrawerElementModel> drawerItems = [
  DrawerElementModel(name: 'Account',color: Colors.red[400]),
  DrawerElementModel(name: 'Cart Items',color: Colors.green[400]),
  DrawerElementModel(name: 'Previous Orders',color: Colors.teal[400]),
  DrawerElementModel(name: 'Your Reviews',color: Colors.redAccent[400]),
  DrawerElementModel(name: 'About Us',color: Colors.tealAccent[400]),
  DrawerElementModel(name: 'Logout',color: Colors.greenAccent[400]),
];
