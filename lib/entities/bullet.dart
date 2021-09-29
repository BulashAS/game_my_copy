import 'package:flutter/material.dart';
import 'entity.dart';

class Bullet extends Entity {
  final double playerAngle;

  Bullet(this.playerAngle, double playerX, double playerY) : super("bullet") {
    x = playerX;
    y = playerY;
  }

  @override
  Widget build() {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  void move() {
    // TODO: implement move
  }

  @override
  void update() {
    // TODO: implement update
  }
}
