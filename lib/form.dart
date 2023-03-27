import 'package:flutter/material.dart';
import 'details.dart';


class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}


class _MyFormState extends State<MyForm> {
  var prod;
  final _productController = TextEditingController();


  @override
  void initState() {
    super.initState();

    _productController.addListener(_updateText);
  }

  void _updateText(){
    setState((){
      prod = _productController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
        //title: const Text("Form"), centerTitle: true,),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: ListView(
             children: [
            //   TextFormField(
            //     controller: _productController,
            //     decoration: InputDecoration(
            //       hintText: "Product Name",
            //       icon: Icon(Icons.verified_user_outlined),
            //       border: OutlineInputBorder()
            //     ),
            //   ),
              SizedBox(height: 20.0,),
              myBtn(context,"Play"),
              myBtn(context, "Options"),
            ],
          ),

      ),
    );
  }

   myBtn(BuildContext , text) {
    return SizedBox(
      width: 100, // set the button width
      height: 75, // set the button height
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFD9D9D9)), // set the background color to gray
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black), // set t: MaterialStateProperty.all<Color>(Color(0xFFD9D9D9)), // set the text color to D9D9D9
        ),
        onPressed: () {
          // button pressed action
        },
        child: Text('Click me'), // set the button text
      ),
    );
  }
}
