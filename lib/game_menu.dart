import 'package:flutter/material.dart';

class GameMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Math Surfer',
              style: TextStyle(fontSize: 24.0),
            ),
            const SizedBox(height: 20.0),
            playButton(context),
          ],
        ),
      ),
    );
  }
}

playButton(buildContext) {
  return SizedBox(
    width: 200, // set the button width
    height: 75, // set the button height
    child: TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            const Color(0xff8c8c8c)), // set the background color to gray
        foregroundColor: MaterialStateProperty.all<Color>(Colors
            .black), // set t: MaterialStateProperty.all<Color>(Color(0xFFD9D9D9)), // set the text color to D9D9D9
      ),
      onPressed: () {
        Navigator.pushNamed(buildContext, '/options');
      },
      child: const Text('play'), // set the button text
    ),
  );
}
