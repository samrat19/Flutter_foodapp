import 'package:flutter/material.dart';
import 'package:food/components/background_widget.dart';

class AllItemsScreen extends StatelessWidget {

  final double height;
  final bool  isVeg;

  const AllItemsScreen({Key key, this.height, @required this.isVeg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Colors.white,
      child: Container(
        height: height,
        child: BackgroundWidget(
          topCircleColor: Colors.yellow[700],
          bottomCircleColor: isVeg?Colors.green[800]:Colors.red,
        ),
      ),
    );
  }
}
