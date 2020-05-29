import 'dart:math';
import 'package:flutter/material.dart';
import 'package:particle_practice/palette_colors.dart';
import 'package:particle_practice/particle.dart';

class ParticleHandler with ChangeNotifier{

  int numOfParticles;
  List<Particle> particles;
  double width;
  double height;


  ParticleHandler({
    Size size,
    this.numOfParticles = 40,
}){
    particles = List<Particle>(numOfParticles);
    setSize(size);
  }


  void init() {
    for (int i = 0; i < numOfParticles; i++) {

      //Show random color here
//      var color = Rnd.getItem(palette.components);
      var color = PaletteColors.getRandomColor();
      particles[i] = Particle(color: color);
      resetParticle(i);
    }
  }

  Particle resetParticle(int i) {
    Particle p = particles[i];
    p.size = p.life = p.lifeLeft = 0;
    p.x = Random().nextInt(width.toInt()).toDouble();
    p.y = height-30;
    return p;
  }



  void setSize(Size size) {
    width = size.width;
    height = size.height;
    init();
  }


  void tick(){
    notifyListeners();
  }




}