import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pokemon_app/Characters/brendan.dart';
import 'package:pokemon_app/button.dart';
import 'package:pokemon_app/maps/house.dart';
import 'package:pokemon_app/maps/littleroot.dart';
import 'package:pokemon_app/maps/laboratory.dart';
import 'package:pokemon_app/maps/mybredroom.dart';
import 'package:pokemon_app/Characters/Abedul.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
/*
  VARIABLES
*/

//Littleroot
  double mapX = 1.165;
  double mapY = 0.65;

//Laboratory
  double labMapX = 0;
  double labMapY = 0;

//MyHouse
  double houseMapX = 0;
  double houseMapY = 0;

//MyBedroom
  double myBedX = -2;
  double myBedY = 0.75;

//Brendan
  int BrendanSpriteCount = 0; //0 for standing, 1-2 for walking
  String BrendanDirection = 'Down';

//Abedul
  String AbedulDirection = 'Down';
  static double AbedulX = 0.35;
  static double AbedulY = -0.55;
  bool chatStarted = false;
  int countPressing = -1;

//game stuff
  String currentLocation = 'littleroot';
  double step = 0.25;

//barreras para littleroot
  List<List<double>> noMansLandLittleroot = [
    //oak
    [0.1, 0.55],
    [-0.1, 0.55],
    [0.665, 0.9],
    [0.915, 0.9],
    [0.915, 1.15],
    [0.915, 1.4],
    [0.915, 1.65],
    [0.915, 1.9],
    [0.915, 1.9],
    [1.165, 1.15],
    [1.165, 1.9],
    [1.415, 0.9],
    [1.415, 1.9],
    [1.665, 0.9],
    [1.665, 1.9],
    [1.915, 0.9],
    [1.915, 1.15],
    [1.915, 1.4],
    [1.915, 1.65],
    [-0.585, 0.9],
    [-0.585, 1.15],
    [-0.585, 1.4],
    [-5.585, 1.65],
    [-0.835, 0.9],
    [-0.835, 1.9],
    [-1.085, 1.15],
    [-1.085, 1.9],
    [-1.335, 0.9],
    [-1.335, 1.9],
    [-1.335, -0.35],
    [-1.585, 0.9],
    [-1.585, 1.9],
    [-1.835, 0.9],
    [-1.835, 1.15],
    [-1.835, 1.4],
    [-1.835, 1.65],
    [0.165, -0.1],
    [0.165, -0.35],
    [0.165, -0.6],
    [0.165, -0.85],
    [0.165, -1.1],
    [0.41500000000000004, -0.1],
    [0.41500000000000004, -1.1],
    [0.665, -0.1],
    [0.665, -0.85],
    [0.915, -1.35],
    [0.915, -0.1],
    [0.915, -1.1],
    [1.165, -0.1],
    [1.165, -1.1],
    [1.415, -0.1],
    [1.415, -1.1],
    [1.665, -0.1],
    [1.665, -0.35],
    [1.665, -0.6],
    [1.665, -0.85],
    [1.665, -1.1],
    [1.915, -2.1],
    [1.665, -2.1],
    [1.415, -2.1],
    [1.165, -2.1],
    [0.915, -2.1],
    [0.665, -2.1],
    [0.41500000000000004, -2.1],
    [0.165, -2.1],
    [-0.0849, -2.1],
    [-0.334, -2.1],
    [-0.585, -2.1],
    [-0.835, -2.1],
    [-1.085, -2.1],
    [-1.335, -2.1],
    [1.915, 2.56],
    [1.665, 2.56],
    [1.415, 2.56],
    [1.165, 2.56],
    [0.915, 2.56],
    [0.665, 2.56],
    [0.41500000000000004, 2.56],
    [0.165, 2.56],
    [-1.835, 2.56],
    [-1.585, 2.56],
    [-0.585, 2.56],
    [-0.835, 2.56],
    [-1.085, 2.56],
    [-1.335, 2.56],
    [2.165, 2.4],
    [2.165, 2.15],
    [2.415, 2.15],
    [2.665, 1.9],
    [2.665, 1.65],
    [2.665, 1.4],
    [2.665, 1.15],
    [2.665, 0.9],
    [2.665, 0.649],
    [2.665, 0.39],
    [2.665, 0.149],
    [2.665, -0.1],
    [2.665, -0.35],
    [2.665, -0.6],
    [2.665, -0.85],
    [2.665, -1.1],
    [2.665, -1.35],
    [2.415, -1.6],
    [2.165, -1.6],
    [2.165, -1.85],
    [-1.585, -1.85],
    [-1.585, -1.6],
    [-1.835, -1.6],
    [-2.085, -1.35],
    [-2.085, -1.1],
    [-2.335, -1.1],
    [-2.585, -0.85],
    [-2.585, -0.6],
    [-2.585, -0.35],
    [-2.585, -0.1],
    [-2.585, 0.149],
    [-2.585, 0.3999999],
    [-2.585, 0.65],
    [-2.585, 0.9],
    [-2.585, 1.15],
    [-2.585, 1.4],
    [-2.585, 1.65],
    [-2.585, 1.9],
    [-2.335, 2.15],
    [-2.085, 2.15],
    [-2.085, 2.4]
  ];

  List<List<double>> noMansLandLaboratory = [
    [2.25, -1.25],
    [2.5, -1.25],
    [
      2.5,
      -1.5,
    ],
    [2.5, -1.75],
    [2.5, -2],
    [2.5, -2.25],
    [2.25, -2],
    [2.25, -2.25],
    [2.25, -1.75],
    [2.25, -1.5],
    [2.75, -1.5],
    [2.75, -2.25],
    [1.25, -2.75],
    [1.5, -2.75],
    [3, -2.75],
    [2.75, -3],
    [2.5, -3],
    [2.25, -3],
    [2, -3],
    [1.75, -3],
    [1, -3],
    [0.75, -3],
    [0.5, -3],
    [0.25, -3],
    [-0.75, -3],
    [-1, -3],
    [-1.25, -3],
    [-1.5, -3],
    [-1.75, -3],
    [-2, -3],
    [-2.25, -3],
    [-2.5, -3],
    [-2.75, -3],
    [-3, -2.75],
  ];

  List<List<double>> noMansLandHouse = [
    [0.5, -1.0],
    [0.75, -1.0],
    [1.0, -1.0],
    [1.0, -0.75],
    [1.0, -0.5],
    [1.0, -1.5],
    [1.25, -1.5],
    [1.25, -1],
    [1.25, -0.75],
    [1.25, -0.5],
    [1.5, -1.5],
    [1.75, -1.5],
    [2, -1.5],
    [2.25, -1.5],
    [2.5, -1.5],
    [2.75, -1.5],
    [3, -1.5],
    [0.75, -0.5],
    [0.5, -0.5],
    [0.5, -0.75],
    [0.5, 0.0],
    [0.5, 0.25],
    [0.5, 0.75],
    [0.5, 1],
    [0.5, -1.5],
    [0.25, -1.5],
    [0.25, -1],
    [0.25, -0.75],
    [0.25, -0.5],
    [0, -1.5],
    [0.75, -1.5],
    [0.75, 0.25],
    [1, 0.25],
    [1.25, 0.25],
    [1.5, 0.25],
    [1.75, 0.25],
    [1.75, 0],
    [1.5, 0],
    [1.25, 0],
    [1, 0],
    [-0.25, -1.5],
    [-0.5, -1.5],
    [-0.25, -1.5],
    [-0.75, -1.5],
    [-1, -1.5],
    [-1.25, -1.5],
    [-1.25, 0.75],
    [-2.75, -1.5],
    [-2, 0.75],
    [-3, -1.5],
    [-1, 1],
    [-3, -1.25],
    [-3, -1],
    [-3, -0.75],
    [-3, -0.5],
    [-3, -0.25],
    [-3, 0],
    [-3, 0.25],
    [-3, 0.5],
    [-3, 0.75],
    [-2.75, 0.75],
    [-2.5, 0.75],
    [-2.25, 0.75],
    [-1, 0.75],
    [3, -1.25],
    [3, -1],
    [3, -0.75],
    [3, -0.5],
    [3, -0.25],
    [3, 0],
    [3, 0.25],
    [3, 0.5],
    [3, 0.75],
    [2.75, 0.75],
    [2.5, 0.75],
    [2.25, 0.75],
    [2, 0.75],
    [1.75, 0.75],
    [1.5, 0.75],
    [1.25, 0.75],
    [1, 0.75],
    [0.75, 0.75],
    [0.75, 0],
    [-0.75, 1.25],
    [-0.5, 1.25],
    [-0.25, 1.25],
    [0, 1.25],
    [0.25, 1.25],
    [0.5, 1.25],
  ];

  List<List<double>> noMansLandBedroom = [
    [-2, 1.5]
  ];

  void moveUp() {
    BrendanDirection = 'Up';

    //NoMansLandLittleroot
    if (currentLocation == 'littleroot') {
      if (canMoveTo(BrendanDirection, noMansLandLittleroot, mapX, mapY)) {
        setState(() {
          mapY += step;

          //Enter to laboratory
          if (double.parse((mapX).toStringAsFixed(4)) == 0.665 &&
              double.parse((mapY).toStringAsFixed(4)) == -1.1) {
            setState(() {
              currentLocation = 'laboratory';
              labMapX = -0.25;
              labMapY = -2.5;
            });
          }

          //Enter to myHouse
          if (double.parse((mapX).toStringAsFixed(4)) == 1.165 &&
              double.parse((mapY).toStringAsFixed(4)) == 0.9) {
            setState(() {
              currentLocation = 'myHouse';
              houseMapX = -1.75;
              houseMapY = -1.5;
            });
          }
        });
      }
    }

    //NoMansLandLaboratory
    if (currentLocation == 'laboratory') {
      if (canMoveTo(BrendanDirection, noMansLandLaboratory, labMapX, labMapY)) {
        setState(() {
          labMapY += step;
        });
      }
    }
    if (currentLocation == 'myHouse') {
      if (canMoveTo(BrendanDirection, noMansLandHouse, houseMapX, houseMapY)) {
        setState(() {
          houseMapY += step;

          if (double.parse((houseMapX).toStringAsFixed(4)) == -1.75 &&
              double.parse((houseMapY).toStringAsFixed(4)) == 0.75) {
            setState(() {
              currentLocation = 'myBedroom';
              houseMapX = -2;
              houseMapY = 0.75;
              BrendanDirection = 'Down';
            });
          }
        });
      }
    }

    //Movimiento Bedroom
    if (currentLocation == 'myBedroom') {
      if (canMoveTo(BrendanDirection, noMansLandBedroom, myBedX, myBedY)) {
        setState(() {
          myBedY += step;

          if (double.parse((myBedX).toStringAsFixed(4)) == -2 &&
              double.parse((myBedY).toStringAsFixed(4)) == 1.25) {
            setState(() {
              currentLocation = 'myHouse';
              houseMapX = -1.75;
              houseMapY = 0.5;
              BrendanDirection = 'Down';
            });
          }
        });
      }
    }
    animatedWalk();
  }

  void moveDown() {
    BrendanDirection = 'Down';

    //NoMansLandLittleroot
    if (currentLocation == 'littleroot') {
      if (canMoveTo(BrendanDirection, noMansLandLittleroot, mapX, mapY)) {
        setState(() {
          mapY -= step;
        });
      }
    }
    if (currentLocation == 'laboratory') {
      if (canMoveTo(BrendanDirection, noMansLandLaboratory, labMapX, labMapY)) {
        setState(() {
          labMapY -= step;

          if (double.parse((labMapX).toStringAsFixed(4)) == 0 &&
                  double.parse((labMapY).toStringAsFixed(4)) == -3 ||
              double.parse((labMapX).toStringAsFixed(4)) == -0.25 &&
                  double.parse((labMapY).toStringAsFixed(4)) == -3 ||
              double.parse((labMapX).toStringAsFixed(4)) == -0.5 &&
                  double.parse((labMapY).toStringAsFixed(4)) == -3) {
            setState(() {
              currentLocation = 'littleroot';
              labMapX = 1.165;
              labMapY = 0.4;
            });
          }
        });
      }
    }
    if (currentLocation == 'myHouse') {
      if (canMoveTo(BrendanDirection, noMansLandHouse, houseMapX, houseMapY)) {
        setState(() {
          houseMapY -= step;

          if (double.parse((houseMapX).toStringAsFixed(4)) == -1.75 &&
                  double.parse((houseMapY).toStringAsFixed(4)) == -1.5 ||
              double.parse((houseMapX).toStringAsFixed(4)) == -1.5 &&
                  double.parse((houseMapY).toStringAsFixed(4)) == -1.5 ||
              double.parse((houseMapX).toStringAsFixed(4)) == -2 &&
                  double.parse((houseMapY).toStringAsFixed(4)) == -1.5 ||
              double.parse((houseMapX).toStringAsFixed(4)) == -2.25 &&
                  double.parse((houseMapY).toStringAsFixed(4)) == -1.5) {
            setState(() {
              currentLocation = 'littleroot';
              labMapX = 0.665;
              labMapY = -1.6;
            });
          }
        });
      }
    }
    if (currentLocation == 'myBedroom') {
      if (canMoveTo(BrendanDirection, noMansLandBedroom, myBedX, myBedY)) {
        setState(() {
          myBedY -= step;
        });
      }
    }
    animatedWalk();
  }

  void moveLeft() {
    BrendanDirection = 'Left';

    //noMansLandLittleroot
    if (currentLocation == 'littleroot') {
      if (canMoveTo(BrendanDirection, noMansLandLittleroot, mapX, mapY)) {
        setState(() {
          mapX += step;
        });
      }
    }
    if (currentLocation == 'laboratory') {
      if (canMoveTo(BrendanDirection, noMansLandLaboratory, labMapX, labMapY)) {
        setState(() {
          labMapX += step;
        });
      }
    }
    if (currentLocation == 'myHouse') {
      if (canMoveTo(BrendanDirection, noMansLandHouse, houseMapX, houseMapY)) {
        setState(() {
          houseMapX += step;
        });
      }
    }
    if (currentLocation == 'myBedroom') {
      if (canMoveTo(BrendanDirection, noMansLandBedroom, myBedX, myBedY)) {
        setState(() {
          myBedX += step;
        });
      }
    }
    animatedWalk();
  }

  void moveRight() {
    BrendanDirection = 'Right';

    //NoMansLandLittleroot
    if (currentLocation == 'littleroot') {
      if (canMoveTo(BrendanDirection, noMansLandLittleroot, mapX, mapY)) {
        setState(() {
          mapX -= step;
        });
      }
    }
    if (currentLocation == 'laboratory') {
      if (canMoveTo(BrendanDirection, noMansLandLaboratory, labMapX, labMapY)) {
        setState(() {
          labMapX -= step;
        });
      }
    }
    if (currentLocation == 'myHouse') {
      if (canMoveTo(BrendanDirection, noMansLandHouse, houseMapX, houseMapY)) {
        setState(() {
          houseMapX -= step;
        });
      }
    }
    if (currentLocation == 'myBedroom') {
      if (canMoveTo(BrendanDirection, noMansLandBedroom, myBedX, myBedY)) {
        setState(() {
          myBedX -= step;
        });
      }
    }
    animatedWalk();
  }

  void pressedA() {}
  void pressedB() {}

  void animatedWalk() {
    print('x: ' + labMapX.toString() + ', y:' + labMapY.toString());

    Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        BrendanSpriteCount = (BrendanSpriteCount + 1) % 3;
      });
      if (BrendanSpriteCount == 0) {
        timer.cancel();
      }
    });
  }

  bool canMoveTo(String direction, var noMansLand, double x, double y) {
    double StepX = 0;
    double StepY = 0;

    if (direction == 'Left') {
      StepX = step;
      StepY = 0;
    } else if (direction == 'Right') {
      StepX = -step;
      StepY = 0;
    } else if (direction == 'Up') {
      StepX = 0;
      StepY = step;
    } else if (direction == 'Down') {
      StepX = 0;
      StepY = -step;
    }

    double newX = x + StepX;
    double newY = y + StepY;

    //seleccionar las barreras

    List<List<double>> noMansLand = [];
    if (currentLocation == 'littleroot') {
      noMansLand = noMansLandLittleroot;
    } else if (currentLocation == 'laboratory') {
      noMansLand = noMansLandLaboratory;
    } else if (currentLocation == 'myHouse') {
      noMansLand = noMansLandHouse;
    } else if (currentLocation == 'myBredroom') {
      noMansLand = noMansLandBedroom;
    }

    print('Intentando mover a: X=$newX, Y=$newY');

    for (int i = 0; i < noMansLand.length; i++) {
      if ((cleanNum(noMansLand[i][0]) == cleanNum(newX)) &&
          (cleanNum(noMansLand[i][1]) == cleanNum(newY))) {
        print(
            'Colisión detectada en X=${noMansLand[i][0]}, Y=${noMansLand[i][0]}');
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        AspectRatio(
            aspectRatio: 1,
            child: Container(
                color: Colors.black,
                child: Stack(children: [
                  //littleroot
                  LittleRoot(
                    x: mapX,
                    y: mapY,
                    currentMap: currentLocation,
                  ),

                  //Laboratory
                  MyLaboratory(
                    x: labMapX,
                    y: labMapY,
                    currentMap: currentLocation,
                  ),

                  MyHouse(
                    x: houseMapX,
                    y: houseMapY,
                    currentMap: currentLocation,
                  ),

                  MyBedroom(
                    x: myBedX,
                    y: myBedY,
                    currentMap: currentLocation,
                  ),

                  //Abedul
                  Container(
                      alignment: const Alignment(0, 0),
                      child: MyAbedul(
                          x: mapX,
                          y: mapY + 0.05,
                          location: currentLocation,
                          AbedulDirection: AbedulDirection)),

                  //Brendan
                  Container(
                      alignment: Alignment(0, 0),
                      child: MyBrendan(
                          location: currentLocation,
                          BrendanSpriteCount: BrendanSpriteCount,
                          direction: BrendanDirection))
                ]))),
        Expanded(
          child: Container(
            color: Colors.grey[900],
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('G A M E B O Y  A D V A N C E',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                )),
                            Text(' ⎉',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 30)),
                          ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(children: [
                            Column(children: [
                              Container(
                                height: 50,
                                width: 50,
                              ),
                              MyButton(
                                text: '←',
                                function: moveLeft,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                              ),
                            ]),
                            Column(children: [
                              MyButton(
                                text: '↑',
                                function: moveUp,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                              ),
                              MyButton(
                                text: '↓',
                                function: moveDown,
                              ),
                            ]),
                            Column(children: [
                              Container(
                                height: 50,
                                width: 50,
                              ),
                              MyButton(
                                text: '→',
                                function: moveRight,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                              ),
                            ])
                          ]),
                          Row(children: [
                            Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                ),
                                MyButton(
                                  text: 'b',
                                  function: pressedB,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                MyButton(
                                  text: 'a',
                                  function: pressedA,
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                ),
                              ],
                            )
                          ])
                        ],
                      ),
                      Text('C R E A T E D  B Y  M A U R I',
                          style: TextStyle(color: Colors.white)),
                    ])),
          ),
        ),
      ],
    ));
  }

  double cleanNum(double value, {int precision = 2}) {
    return double.parse(value.toStringAsFixed(precision));
  }
}
