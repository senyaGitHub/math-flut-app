import 'package:flutter/material.dart';

class Datails extends StatelessWidget {
  Datails({Key? key, required this.prod}) : super(key: key);
    String prod;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Details"),
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back)),
        ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.account_balance_wallet_outlined),
              title: Text(prod),
            )
          ],
        ),
      ),
      );
  }
}
