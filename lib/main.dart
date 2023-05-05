import 'package:flutter/material.dart';
import 'game_menu.dart'; // Import the file containing GameMenu
import 'game.dart'; // Import the file containing Game
import 'options.dart'; // Import the file containing Options

void main() {
  runApp(
    MaterialApp(
      title: 'Math Quiz Game',
      initialRoute: '/game-menu',
      routes: {
        '/game-menu': (context) => GameMenu(),
        '/game': (context) => Game(level: 1, showAnswers: true),
        '/options': (context) => Options(),
      },
    ),
  );
}
