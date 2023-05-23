import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  final int level;

  const Game({Key? key, required this.level}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  Timer? _timer;
  late int _timeRemaining;
  int num1 = 0;
  int num2 = 0;
  String operation = '';
  int answer = 0;
  int score = 0;
  int questionCount = 0;
  List<int> answers = List.filled(4, 0);

  void generateQuestion() {
    final random = Random();
    num1 = random.nextInt(12) + 1;
    num2 = random.nextInt(12) + 1;
    final operationIndex = random.nextInt(4);
    switch (operationIndex) {
      case 0:
        operation = '+';
        answer = num1 + num2;
        break;
      case 1:
        operation = '-';
        if (num1 < num2) {
          final temp = num1;
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
        num1 = num2 * (random.nextInt(12) + 1);
        answer = num1 ~/ num2;
        break;
    }

    answers[0] = answer;
    answers[1] = answer;
    answers[2] = answer;
    answers[3] = answer;

    while (answers[1] == answer) {
      answers[1] = answer + random.nextInt(10) + 1;
    }

    while (answers[2] == answer || answers[2] < 0) {
      answers[2] = answer - random.nextInt(10) - 1;
    }

    while (answers[3] == answer || answers[3] < 0) {
      answers[3] = answer - random.nextInt(10) - 1;
    }

    answers.shuffle();
  }

  void checkAnswer(int userAnswer) {
    if (_timer != null) {
      _timer?.cancel();
    }
    setState(() {
      if (userAnswer == answer) {
        score++;
      }
      questionCount++;

      if (questionCount >= 10) {
        bool clearedLevel = (score >= 7);
        if (clearedLevel) {
          if (widget.level == 2 || widget.level == 3)
            Text(
              'Time Remaining: $_timeRemaining',
              style: const TextStyle(fontSize: 16.0),
            );

          score = 0;
        }
        Navigator.pushReplacementNamed(context, '/game-menu');
      } else {
        generateQuestion();
        if (widget.level == 2 || widget.level == 3) {
          startTimer();
        }
      }
    });
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeRemaining > 0) {
          _timeRemaining--;
        } else {
          timer.cancel();
          checkAnswer(-1);
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    generateQuestion();

    _timeRemaining = (widget.level >= 2 && widget.level <= 3) ? 10 : 0;
    if (_timeRemaining > 0) {
      startTimer();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (questionCount <= 10) {
      bool clearedLevel = (score >= 7);
      if (clearedLevel) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Next Level',
                  style: const TextStyle(fontSize: 24.0),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff3D4451),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(
                        color: const Color(0xff3D4451),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/game');
                  },
                  child: Container(
                    width: 120,
                    height: 60,
                    alignment: Alignment.center,
                    child: const Text(
                      'Restart',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff3D4451),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(
                        color: const Color(0xff3D4451),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/game-menu');
                  },
                  child: Container(
                    width: 120,
                    height: 60,
                    alignment: Alignment.center,
                    child: const Text(
                      'Main Menu',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    } else {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Game Over',
                style: const TextStyle(fontSize: 24.0),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff3D4451),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(
                      color: const Color(0xff3D4451),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/game');
                },
                child: Container(
                  width: 120,
                  height: 60,
                  alignment: Alignment.center,
                  child: const Text(
                    'Restart',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff3D4451),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(
                      color: const Color(0xff3D4451),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/game-menu');
                },
                child: Container(
                  width: 120,
                  height: 60,
                  alignment: Alignment.center,
                  child: const Text(
                    'Main Menu',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

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
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xff3D4451),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(
                                color: const Color(0xff3D4451),
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
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xff3D4451),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(
                                color: const Color(0xff3D4451),
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
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xff3D4451),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(
                                color: const Color(0xff3D4451),
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
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xff3D4451),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(
                                color: const Color(0xff3D4451),
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
            ),
            const SizedBox(height: 20.0),
            Text(
              'Score: $score',
              style: const TextStyle(fontSize: 24.0),
            ),
            if (widget.level == 2 || widget.level == 3)
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
