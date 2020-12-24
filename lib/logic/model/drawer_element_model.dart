import 'package:flutter/material.dart';

class DrawerElementModel{
  final String name;
  final Color color;
  final Alignment alignment;
  final Widget child;

  const DrawerElementModel({@required this.name, @required this.color, @required this.alignment, @required this.child});
}
