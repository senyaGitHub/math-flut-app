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
      appBar: AppBar(
        title: const Text("Form"), centerTitle: true,),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            children: [
              TextFormField(
                controller: _productController,
                decoration: InputDecoration(
                  hintText: "Product Name",
                  icon: Icon(Icons.verified_user_outlined),
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 20.0,),
              myBtn(context),
            ],
          ),

      ),
    );
  }

  ElevatedButton myBtn(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(minimumSize: const Size(200, 50)),
      child: Text("Submit Form"),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Datails(prod: _productController.text);
        }));
      },
    );
  }
}
