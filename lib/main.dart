import 'package:flutter/material.dart';
import 'game_menu.dart';
import 'game.dart';
import 'options.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Math Surfer',
      initialRoute: '/game-menu',
      themeMode: _themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      routes: {
        '/game-menu': (context) => GameMenu(),
        '/game': (context) => Game(level: 1, showAnswers: true),
        '/options': (context) => Options(
              themeMode: _themeMode,
              onThemeChanged: (ThemeMode newThemeMode) {
                setState(() {
                  _themeMode = newThemeMode;
                });
              },
            ),
      },
    );
  }
}
