import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_my_copy/game_core/game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .whenComplete(() {
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Game()
    ));
  });
}
