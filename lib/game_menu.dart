import 'package:flutter/material.dart';

import 'game.dart';
import 'options.dart';

class GameMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Math Surfer',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20.0),
            playButton(context),
            SizedBox(height: 20.0),
            optionsButton(context),
          ],
        ),
      ),
    );
  }
}

playButton(BuildContext) {
  return SizedBox(
    width: 200, // set the button width
    height: 75, // set the button height
    child: TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            Color(0xff8c8c8c)), // set the background color to gray
        foregroundColor: MaterialStateProperty.all<Color>(Colors
            .black), // set t: MaterialStateProperty.all<Color>(Color(0xFFD9D9D9)), // set the text color to D9D9D9
      ),
      onPressed: () {
        Navigator.pushNamed(BuildContext, '/options');
      },
      child: Text('play'), // set the button text
    ),
  );
}

optionsButton(BuildContext) {
  return SizedBox(
    width: 200, // set the button width
    height: 75, // set the button height
    child: TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            Color(0xff8c8c8c)), // set the background color to gray
        foregroundColor: MaterialStateProperty.all<Color>(Colors
            .black), // set t: MaterialStateProperty.all<Color>(Color(0xFFD9D9D9)), // set the text color to D9D9D9
      ),
      onPressed: () {
        Navigator.pushNamed(BuildContext, '/options');
      },
      child: Text('options'), // set the button text
    ),
  );
}
