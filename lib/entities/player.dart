import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:game_my_copy/entities/entity.dart';

class Player extends Entity {
  Player() : super("player") {
    x = 50;
    y = 150;
  }

  @override
  Widget build() {
    return Positioned(
      top: y,
      left: x,
      child: visible ? sprites.first : const SizedBox(),
    );
  }

  @override
  void move() {
    x++;
    if (x > 500) {
      x = 50;
    }
  }

  @override
  void update() {
    move();
  }
}
