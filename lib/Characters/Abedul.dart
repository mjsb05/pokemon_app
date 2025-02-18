import 'package:flutter/material.dart';

class MyAbedul extends StatelessWidget {
  final double x;
  final double y;
  final String location;
  final String AbedulDirection;

  MyAbedul(
      {super.key,
      required this.x,
      required this.y,
      required this.location,
      required this.AbedulDirection});

  @override
  Widget build(BuildContext context) {
    if (location == 'littleroot') {
      return Container(
          alignment: Alignment(x, y),
          child: Image.asset(
            'lib/images/Abedul' + AbedulDirection + '.png',
            width: MediaQuery.of(context).size.width * 0.03,
            fit: BoxFit.cover,
          ));
    } else {
      return Container();
    }
  }
}
