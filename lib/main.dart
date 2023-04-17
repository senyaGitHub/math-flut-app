import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MathGame());
}

class MathGame extends StatefulWidget {
  @override
  _MathGameState createState() => _MathGameState();
}

class _MathGameState extends State<MathGame> {
  int num1 = 0;
  int num2 = 0;
  int answer = 0;
  int userAnswer = 0;
  int score = 0;

  void _generateQuestion() {
    setState(() {
      num1 = Random().nextInt(10);
      num2 = Random().nextInt(10);
      answer = num1 + num2;
      userAnswer = 0;
    });
  }

  void _checkAnswer(int choice) {
    setState(() {
      if (choice == answer) {
        score += 1;
      }
      _generateQuestion();
    });
  }

  @override
  void initState() {
    super.initState();
    _generateQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Math Game',
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Score: $score',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$num1 + $num2 = ?',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _checkAnswer(0);
                    },
                    child: Text('${Random().nextInt(20)}'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _checkAnswer(1);
                    },
                    child: Text('${Random().nextInt(20)}'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _checkAnswer(2);
                    },
                    child: Text('${Random().nextInt(20)}'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _checkAnswer(3);
                    },
                    child: Text('$answer'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
