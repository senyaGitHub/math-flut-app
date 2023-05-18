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
            const SizedBox(height: 20.0),
            optionsButton(context),
          ],
        ),
      ),
    );
  }
}

Widget playButton(BuildContext context) {
  return SizedBox(
    width: 200,
    height: 75,
    child: TextButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xFF8C8C8C)),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/game');
      },
      child: const Text('Play'),
    ),
  );
}

Widget optionsButton(BuildContext context) {
  return SizedBox(
    width: 200,
    height: 75,
    child: TextButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xFF8C8C8C)),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/options');
      },
      child: const Text('Options'),
    ),
  );
}
