import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Math Quiz Game',
      initialRoute: '/game-menu',
      routes: {
        '/game-menu': (context) => GameMenu(),
        '/game': (context) => Game(),
        '/options': (context) => Options(),
      },
    ),
  );
}

class GameMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Math Quiz Game',
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

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  int num1 = Random().nextInt(100);
  int num2 = Random().nextInt(100);
  int answer = 0;
  int score = 0;

  void checkAnswer(int userAnswer) {
    setState(() {
      if (userAnswer == answer) {
        score++;
      } else {
        score--;
      }
      num1 = Random().nextInt(100);
      num2 = Random().nextInt(100);
      answer = num1 + num2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$num1 + $num2 = ?',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFD9D9D9)), // set the background color to gray
                    foregroundColor: MaterialStateProperty.all<Color>(Colors
                        .black), // set t: MaterialStateProperty.all<Color>(Color(0xFFD9D9D9)), // set the text color to D9D9D9
                  ),
                  onPressed: () {
                    checkAnswer(num1 + num2);
                  },
                  child: Text('${num1 + num2}'),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFD9D9D9)), // set the background color to gray
                    foregroundColor: MaterialStateProperty.all<Color>(Colors
                        .black), // set t: MaterialStateProperty.all<Color>(Color(0xFFD9D9D9)), // set the text color to D9D9D9
                  ),
                  onPressed: () {
                    checkAnswer(Random().nextInt(200));
                  },
                  child: Text('${Random().nextInt(200)}'),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFD9D9D9)), // set the background color to gray
                    foregroundColor: MaterialStateProperty.all<Color>(Colors
                        .black), // set t: MaterialStateProperty.all<Color>(Color(0xFFD9D9D9)), // set the text color to D9D9D9
                  ),
                  onPressed: () {
                    checkAnswer(Random().nextInt(200));
                  },
                  child: Text('${Random().nextInt(200)}'),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              'Score: $score',
              style: TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}

class Options extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Options'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/game');
              },
              child: Text('Easy'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/game');
              },
              child: Text('Medium'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/game');
              },
              child: Text('Hard'),
            ),
          ],
        ),
      ),
    );
  }
}

playButton(BuildContext) {
  return SizedBox(
    width: 100, // set the button width
    height: 75, // set the button height
    child: TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            Color(0xFFD9D9D9)), // set the background color to gray
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
    width: 100, // set the button width
    height: 75, // set the button height
    child: TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            Color(0xFFD9D9D9)), // set the background color to gray
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
