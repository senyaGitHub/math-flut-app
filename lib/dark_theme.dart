dart
import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.blue[800],
  accentColor: Colors.green[800],
  backgroundColor: Colors.grey[800],
  scaffoldBackgroundColor: Colors.grey[800],
  textTheme: TextTheme(
    bodyText1: TextStyle(color: Colors.white),
    bodyText2: TextStyle(color: Colors.white),
    button: TextStyle(color: Colors.white),
  ),
);