import 'package:flutter/material.dart';

import 'designed_circle_widget.dart';

class BackgroundWidget extends StatelessWidget {

  final Color topCircleColor;
  final Color bottomCircleColor;

  const BackgroundWidget({Key key, @required this.topCircleColor, @required this.bottomCircleColor,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          bottom: MediaQuery.of(context).size.height*0.57,
          left: MediaQuery.of(context).size.width*0.4,
          child: DesignedCircleWidget(color: topCircleColor,),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height*0.57,
          right: MediaQuery.of(context).size.width*0.4,
          child: DesignedCircleWidget(color:bottomCircleColor),
        ),
      ],
    );
  }
}
