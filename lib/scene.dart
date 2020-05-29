import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:particle_practice/palette.dart';
import 'package:particle_practice/particle_background_handler.dart';
import 'package:particle_practice/particle_handler.dart';
import 'package:particle_practice/particle_painter.dart';
import 'package:particle_practice/rnd.dart';

class Scene extends StatefulWidget {
  Size _size;

  Scene(this._size);

  @override
  _SceneState createState() => _SceneState();
}

class _SceneState extends State<Scene> with SingleTickerProviderStateMixin {
  ParticleHandler _particleBackgroundHandler;
  Ticker _ticker;
  Palette _palette;

  @override
  void initState() {
    _ticker = createTicker(_tick)..start();
    _particleBackgroundHandler = ParticleBackgroundHandler(widget._size);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1500),
        curve: Curves.easeOut,
        child: ClipRect(
          child: Stack(
            children: <Widget>[

              CustomPaint(
                painter: ParticlePainter(
                    particleHandler: _particleBackgroundHandler),
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }


  void _tick(Duration duration) {
    setState(() {
      _particleBackgroundHandler.tick();
    });
  }
}
