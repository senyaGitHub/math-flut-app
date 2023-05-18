import 'package:flutter/material.dart';
import 'game.dart';

class Options extends StatefulWidget {
  final ThemeMode themeMode;
  final Function(ThemeMode) onThemeChanged;

  const Options({
    Key? key,
    required this.themeMode,
    required this.onThemeChanged,
  }) : super(key: key);

  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  bool showAnswers = true;
  int level = 1;
  ThemeMode _themeMode = ThemeMode.light; // Add this line

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
            ListTile(leading: const Text('Theme')),
            Switch(
              value: widget.themeMode == ThemeMode.dark,
              onChanged: (value) {
                widget.onThemeChanged(value ? ThemeMode.dark : ThemeMode.light);
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Game(
                      showAnswers: showAnswers,
                      level: level,
                    ),
                  ),
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
