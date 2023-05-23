import 'package:flutter/material.dart';

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
  bool soundEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 30.0),
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context); // Go back to the main menu
              },
            ),
          ),
          const SizedBox(height: 20.0),
          ListTile(
            leading: const Text('Theme'),
            title: Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Switch(
                      value: widget.themeMode == ThemeMode.dark,
                      onChanged: (value) {
                        widget.onThemeChanged(
                            value ? ThemeMode.dark : ThemeMode.light);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Text('Sound'),
            title: Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Switch(
                      value: soundEnabled,
                      onChanged: (value) {
                        // No functionality added for sound switch
                        setState(() {
                          soundEnabled = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
