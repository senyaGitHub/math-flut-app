import 'dart:math';import 'package:flutter/material.dart';void main() {runApp(MaterialApp(title: 'Math Quiz Game',initialRoute: '/game-menu',routes: {'/game-menu': (context) => GameMenu(),'/game': (context) => Game(),'/options': (context) => Options(),},),);}class GameMenu extends StatelessWidget { @override Widget build(BuildContext context) { return Scaffold(body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [Text('Welcome to Math Quiz Game',style: TextStyle(fontSize: 24.0),),SizedBox(height: 20.0),playButton(context),SizedBox(height: 20.0),optionsButton(context),],),),);} }class Game extends StatefulWidget { @override _GameState createState() => _GameState();}class _GameState extends State<Game> {int n1 = Random().nextInt(100);int n2 = Random().nextInt(100);int ans = 0;int score = 0;void checkAns(int ua) {setState(() {if (ua == ans) {score++;} else {score--;}n1 = Random().nextInt(100);n2 = Random().nextInt(100);ans = n1 + n2;});} @override Widget build(BuildContext context) { return Scaffold(appBar: AppBar(title: Text('Math Quiz Game'),),body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [Text('$n1 + $n2 = ?',style: TextStyle(fontSize: 24.0),),SizedBox(height: 20.0),Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [elevatedButton('Easy', () {setNumbers(10);Navigator.pushNamed(context, '/game');},),elevatedButton('Medium', () {setNumbers(100);Navigator.pushNamed(context, '/game');},),elevatedButton('Hard', () {setNumbers(1000);Navigator.pushNamed(context, '/game');},),],),SizedBox(height: 20.0),Text('Score: $score',style: TextStyle(fontSize: 24.0),),],),),);}void setNumbers(int range) {setState(() {n1 = Random().nextInt(range);n2 = Random().nextInt(range);ans = n1 + n2;score = 0;});}}class Options extends StatelessWidget { @override Widget build(BuildContext context) { return Scaffold(appBar: AppBar(title: Text('Options'),),body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [elevatedButton('Easy', () {Navigator.pushNamed(context, '/game');},),SizedBox(height: 20.0),elevatedButton('Medium', () {Navigator.pushNamed(context, '/game');},),SizedBox(height: 20.0),elevatedButton('Hard', () {Navigator.pushNamed(context, '/game');},),],),),);} }Widget playButton(BuildContext) {return SizedBox(width: 100,height: 75,child: TextButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFD9D9D9)),foregroundColor: MaterialStateProperty.all<Color>(Colors.black),),onPressed: () {Navigator.pushNamed(BuildContext, '/options');},child: Text('play'),),);}Widget optionsButton(BuildContext) {return SizedBox(width: 100,height: 75,child: TextButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFD9D9D9)),foregroundColor: MaterialStateProperty.all<Color>(Colors.black),),onPressed: () {Navigator.pushNamed(BuildContext, '/options');},child: Text('Option))s')))}