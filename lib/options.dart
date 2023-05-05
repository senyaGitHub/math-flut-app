import 'package:flutter/material.dart';
import 'game.dart';

class Options extends StatefulWidget {
  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  bool showAnswers = true;
  int level = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch(
              value: showAnswers,
              onChanged: (value) {
                setState(() {
                  showAnswers = value;
                });
              },
            ),
            const Text('Show answers'),
            const SizedBox(height: 20.0),
            DropdownButton(
              value: level,
              onChanged: (value) {
                setState(() {
                  level = value as int;
                });
              },
              items: [
                DropdownMenuItem(
                  value: 1,
                  child: Text('Level 1'),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text('Level 2'),
                ),
                DropdownMenuItem(
                  value: 3,
                  child: Text('Level 3'),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Game(
                            showAnswers: showAnswers,
                            level: level,
                          )),
                );
              },
              child: const Text('Start Game'),
            ),
          ],
        ),
      ),
    );
  }
}
