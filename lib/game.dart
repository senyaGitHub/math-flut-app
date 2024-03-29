import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  final bool showAnswers;
  final int level;
  const Game({Key? key, required this.showAnswers, required this.level})
      : super(key: key);

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
  int level = 2;
  late Timer _timer = Timer(Duration.zero, () {});
  int _timeRemaining = 0;

  var answers = List.filled(4, 0);

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

    // Generate three possible answers with the correct answer and two other options within a certain range
    answers[0] = answer;
    answers[1] = answer;
    answers[2] = answer;
    answers[3] = answer;
    while (answers[1] == answer) {
      answers[1] = answer + Random().nextInt(10) + 1;
    }

    while (answers[2] == answer || answers[2] < 0) {
      answers[2] = answer - Random().nextInt(10) - 1;
    }
    while (answers[3] == answer || answers[3] < 0) {
      answers[3] = answer - Random().nextInt(10) - 1;
    }
    answers.shuffle();
  }

  void checkAnswer(int userAnswer) {
    setState(() {
      if (_timer != null) {
        _timer.cancel();
      }
      // Check the user's answer and update the score
      if (userAnswer == answer) {
        score++;
      }
      questionCount++;
      if (level >= 2 || level <= 3) {
        _timeRemaining = 10; // Set the time limit to 10 seconds
      }
      if (questionCount >= 10) {
        // If the user has answered 10 questions, navigate back to the GameMenu screen
        bool clearedLevel = (score >= 7);
        Navigator.popUntil(context, ModalRoute.withName('/game-menu'));
        // Increase level if user has cleared the level
        if (clearedLevel) {
          level = level + 1;
          score = 0; // Reset score for next level
          // Set the time limit for the next level
          if (level == 2 || level == 3) {
            _timeRemaining = 10; // Set the time limit to 10 seconds
          }
        }
      } else {
        // Generate a new question
        generateQuestion();
        // If level conditions are met and a new question is generated, start the timer again
        if (level == 2 || level == 3) {
          startTimer();
        }
      }
    });
  }

  // Function  start the timer
  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeRemaining > 0) {
          _timeRemaining--;
        } else {
          timer.cancel(); // Cancel the timer when time is up
          checkAnswer(
              -1); // Submit a wrong answer to move on to the next question
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    generateQuestion();

    if (widget.level == 2 || widget.level == 3) {
      _timeRemaining = 10; // Set the time limit to 10 seconds
      startTimer(); // Start the timer
    }
  }

  @override
  Widget build(BuildContext context) {
    // Shuffle the List to randomize the order of the possible answers

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  '$num1 $operation $num2 = ?',
                  style: const TextStyle(fontSize: 24.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            widget.showAnswers
                ? Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    const Color(0xff3D4451),
                                  ),
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      side: BorderSide(
                                        color: const Color(0xff3D4451),
                                      ),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  checkAnswer(answers[0]);
                                },
                                child: Container(
                                  width: 120,
                                  height: 60,
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${answers[0]}',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    const Color(0xff3D4451),
                                  ),
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      side: BorderSide(
                                        color: const Color(0xff3D4451),
                                      ),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  checkAnswer(answers[1]);
                                },
                                child: Container(
                                  width: 120,
                                  height: 60,
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${answers[1]}',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    const Color(0xff3D4451),
                                  ),
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      side: BorderSide(
                                        color: const Color(0xff3D4451),
                                      ),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  checkAnswer(answers[2]);
                                },
                                child: Container(
                                  width: 120,
                                  height: 60,
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${answers[2]}',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    const Color(0xff3D4451),
                                  ),
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      side: BorderSide(
                                        color: const Color(0xff3D4451),
                                      ),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  checkAnswer(answers[3]);
                                },
                                child: Container(
                                  width: 120,
                                  height: 60,
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${answers[3]}',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : TextField(
                    controller: TextEditingController(),
                    onSubmitted: (value) {
                      int userAnswer = int.tryParse(value) ?? -1;
                      checkAnswer(userAnswer);
                    },
                  ),
            const SizedBox(height: 20.0),
            Text(
              'Score: $score',
              style: const TextStyle(fontSize: 24.0),
            ),
            if (level == 2 || level == 3)
              Text(
                'Time Remaining: $_timeRemaining',
                style: const TextStyle(fontSize: 16.0),
              ),
          ],
        ),
      ),
    );
  }
}
