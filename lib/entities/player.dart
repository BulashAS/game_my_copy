import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:game_my_copy/entities/entity.dart';
import 'package:game_my_copy/utilits/global_vars.dart';

class Player extends Entity {
  Player() : super("player") {
    x = 50;
    y = 150;
  }

  double _angle = 0;
  double _degree = 0;
  bool isMoveLeft = false;
  bool isMoveRight = false;
  int _speed = 3;
  bool isMoving = false;

  @override
  Widget build() {
    return Positioned(
      top: y,
      left: x,
      child: visible
          ? Transform.rotate(
              angle: _angle,
              child: sprites.first,
            )
          : const SizedBox(),
    );
  }

  @override
  void move() {
    if (!isMoving) return;
    if (isMoveLeft) _degree -= 5;
    if (isMoveRight) _degree += 5;

    _angle = 0.0175 * _degree;
    x += sin(_angle) * _speed;
    y -= cos(_angle) * _speed;
    if (x < 0) x = 0;
    if (y < 0) y = 0;
    if (y > GlobalVars.screenHeigth - 50) y = GlobalVars.screenHeigth - 50;
    if (x > GlobalVars.screenWidth - 50) x = GlobalVars.screenWidth - 50;
    isMoveLeft = isMoveRight = false;
  }

  @override
  void update() {
    move();
  }
}
