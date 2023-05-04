import 'dart:math';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  int num1 = 0;
  int num2 = 0;
  String operation = '';
  int answer = 0;
  int score = 0;
  int questionCount = 0;

  void generateQuestion() {
    num1 = Random().nextInt(12) + 1;
    num2 = Random().nextInt(12) + 1;
    int operationIndex = Random().nextInt(4);
    switch (operationIndex) {
      case 0:
        operation = '+';
        answer = num1 + num2;
        break;
      case 1:
        operation = '-';
        if (num1 < num2) {
          int temp = num1;
          num1 = num2;
          num2 = temp;
        }
        answer = num1 - num2;
        break;
      case 2:
        operation = '×';
        answer = num1 * num2;
        break;
      case 3:
        operation = '÷';
        // Make sure the division is a whole number by adjusting num1 and num2
        num1 = num2 * (Random().nextInt(12) + 1);
        answer = num1 ~/ num2;
        break;
    }
  }

  void checkAnswer(int userAnswer) {
    setState(() {
      if (userAnswer == answer) score++;

      questionCount++;
      if (questionCount >= 10) {
        // If the user has answered 10 questions, navigate back to the GameMenu screen
        Navigator.popUntil(context, ModalRoute.withName('/game-menu'));
      } else {
        generateQuestion();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    //Generate the first question
    generateQuestion();
  }

  @override
  Widget build(BuildContext context) {
    // Generate three possible answers with the correct answer and two other options within a certain range
    int answer1 = answer;
    int answer2 = answer;
    while (answer2 == answer) {
      answer2 = answer + Random().nextInt(10) + 1;
    }
    int answer3 = answer;
    while (answer3 == answer || answer3 < 0) {
      answer3 = answer - Random().nextInt(10) - 1;
    }

    // Shuffle the List to randomize the order of the possible answers
    List<int> answers = [answer1, answer2, answer3];
    answers.shuffle();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$num1 $operation $num2 = ?',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff8c8c8c)),
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.black), // set the text color to black
                  ),
                  onPressed: () {
                    checkAnswer(answers[0]);
                  },
                  child: Text('${answers[0]}'),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xff8c8c8c)), // set the background color to gray
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.black), // set the text color to black
                  ),
                  onPressed: () {
                    checkAnswer(answers[1]);
                  },
                  child: Text('${answers[1]}'),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xff8c8c8c)), // set the background color to gray
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.black), // set the text color to black
                  ),
                  onPressed: () {
                    checkAnswer(answers[2]);
                  },
                  child: Text('${answers[2]}'),
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
