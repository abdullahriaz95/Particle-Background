import 'dart:async';
import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:particle_practice/palette.dart';
import 'package:particle_practice/palette_colors.dart';
import 'package:particle_practice/particle_background_handler.dart';
import 'package:particle_practice/particle_painter.dart';
import 'package:particle_practice/scene.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Animation animation;
  Timer _timer;
  AnimationController _animationController;



  @override
  void initState() {
    super.initState();
//    _updateTime();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 60));
    animation = Tween<double>(begin: 0, end: 255)
        .chain(CurveTween(curve: Curves.elasticOut))
        .animate(_animationController)
          ..addListener(() {
            if(animation.isCompleted)
              _animationController.repeat();

            setState(() {});
          });

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Scene(constraints.biggest
              );
        },
      ),
    );



  }

}
