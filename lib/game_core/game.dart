import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:game_my_copy/entities/player.dart';
import 'package:game_my_copy/utilits/common_vars.dart';
import 'main_loop.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  late ReceivePort _receivePort;
  late Isolate _isolateLoop;
  late Player player;

  void startIsolateLoop() async {
    _receivePort = ReceivePort();
    _isolateLoop = await Isolate.spawn(mainLoop, _receivePort.sendPort);
    _receivePort.listen((message) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isStartGame) {
      startIsolateLoop();
      isStartGame = false;
      player = Player();
    }
    player.update();
    return Stack(children: [
      player.build(),
    ]);
  }
}