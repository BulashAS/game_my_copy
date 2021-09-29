import 'package:flutter/material.dart';
import 'package:game_my_copy/entities/player.dart';
import 'package:game_my_copy/scenes/app_scene.dart';
import 'package:game_my_copy/utilits/global_vars.dart';

class GameScene extends AppScene {
  final Player _player = Player();
  double _startGlobalPosition = 0;

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
              child: GestureDetector(
                onPanStart: _onPanStart,
                onPanUpdate: _onPanUpdate,
              ),
            )),
        Positioned(
            top: 0,
            left: GlobalVars.screenWidth / 2,
            child: Container(
              width: GlobalVars.screenWidth / 2,
              height: GlobalVars.screenHeigth / 2,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.green)),
              child: GestureDetector(
                onTap: _onAcceleration,
              ),
            )),
        Positioned(
            top: GlobalVars.screenHeigth / 2,
            left: GlobalVars.screenWidth / 2,
            child: Container(
              width: GlobalVars.screenWidth / 2,
              height: GlobalVars.screenHeigth / 2,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.green)),
              child: GestureDetector(
                onTap: _onShoot,
              ),
            ))
      ],
    );
  }

  @override
  void update() {
    _player.update();
  }

  GameScene();

  void _onPanStart(DragStartDetails details) {
    _startGlobalPosition = details.globalPosition.dx;
  }

  void _onPanUpdate(DragUpdateDetails details) {
    double updateGlobalPosition = details.globalPosition.dx;
    if (updateGlobalPosition > _startGlobalPosition + 30) {
      _player.isMoveRight = true;
    }
    if (updateGlobalPosition < _startGlobalPosition - 30) {
      _player.isMoveLeft = true;
    }
  }

  void _onAcceleration() {
    _player.isMoving = !_player.isMoving;
  }

  void _onShoot() {
  }
}
