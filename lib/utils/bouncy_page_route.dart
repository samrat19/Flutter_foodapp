import 'package:flutter/cupertino.dart';

class BouncyPageRoute extends PageRouteBuilder{
  final Widget child;
  final Alignment alignment;

  BouncyPageRoute({@required this.child, @required this.alignment})
      : super(
            transitionDuration: Duration(milliseconds: 300),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondAnimation,
                Widget child) {
              // animation = CurvedAnimation(
              //   parent: animation,
              //   curve: Curves.elasticInOut,
              // );
              return ScaleTransition(
                child: child,
                alignment: alignment,
                scale: animation,
              );
            },
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondAnimation) {
              return child;
            });
}
