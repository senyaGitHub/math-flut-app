import 'package:flutter/material.dart';
import 'details.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Submit Form"),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Datails();
            }));
          },
        ),
      ),
    );
  }
}
