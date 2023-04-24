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
      },
    ),
  );
}

class GameMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Math Quiz Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Math Quiz Game',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/game');
              },
              child: Text('Start Game'),
            ),
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
      appBar: AppBar(
        title: Text('Math Quiz Game'),
      ),
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
                  onPressed: () {
                    checkAnswer(num1 + num2);
                  },
                  child: Text('${num1 + num2}'),
                ),
                ElevatedButton(
                  onPressed: () {
                    checkAnswer(Random().nextInt(200));
                  },
                  child: Text('${Random().nextInt(200)}'),
                ),
                ElevatedButton(
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
