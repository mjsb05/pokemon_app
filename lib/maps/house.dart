import 'package:flutter/material.dart';

class MyHouse extends StatelessWidget {
  final double x;
  final double y;
  final String currentMap;

  MyHouse({this.x = 0.0, this.y = 0.0, required this.currentMap});

  @override
  Widget build(BuildContext context) {
    if (currentMap == 'myHouse') {
      return Container(
          alignment: Alignment(x, y),
          child: Image.asset(
            'lib/images/myHouse.png',
            width: MediaQuery.of(context).size.width * 0.75,
            fit: BoxFit.cover,
          ));
    } else {
      return Container();
    }
  }
}
