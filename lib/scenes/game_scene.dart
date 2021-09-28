import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/framework.dart';
import 'package:game_my_copy/entities/player.dart';
import 'package:game_my_copy/scenes/app_scene.dart';
import 'package:game_my_copy/utilits/global_vars.dart';

class GameScene extends AppScene {
  Player _player = Player();

  @override
  Widget buildScene() {
    return Stack(
      children: [
        _player.build(),
        Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: GlobalVars.screenWidth / 2,
              height: GlobalVars.screenHeigth,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.green)),
            )
        )
      ],
    );
  }

  @override
  void update() {
    _player.update();
  }
}
