import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {

  final Color color;

  const MenuButton({Key key, @required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color:color),
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          Icons.menu,
          color:color,
        ),
      ),
    );
  }
}
