// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyBrendan extends StatelessWidget {
  final int BrendanSpriteCount;
  final String direction;
  final String location;
  double height = 20;

  MyBrendan(
      {required this.BrendanSpriteCount,
      required this.direction,
      required this.location});
  @override
  Widget build(BuildContext context) {
    if (location == 'littleroot') {
      height = 20;
    } else if (location == 'laboratory') {
      height = 30;
    } else if (location == 'myHouse') {
      height = 40;
    } else if (location == 'myBedroom') {
      height = 40;
    } else if (location == 'escenario' ||
        location == 'escenario' ||
        location == 'battlefinishedscreen') {
      height = 20;
    }
    return Container(
      height: height,
      child: Image.asset(
        'lib/images/Brendan' +
            direction +
            BrendanSpriteCount.toString() +
            '.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
