import 'package:flutter/material.dart';

import 'db_helpter.dart';
class TransferMoney extends StatefulWidget {
  @override
  _TransferMoneyState createState() => _TransferMoneyState();
}

class _TransferMoneyState extends State<TransferMoney> {

  final dbhelper = DatabaseHelper.instance;
  TextEditingController email = TextEditingController();
  TextEditingController balance = TextEditingController();
  var previous_balance = '';
  var current_balance = 0;
  var temp = '';
  var new_balance = 0;

  Future<int> queryspecific() async {
    var allrows = await dbhelper.queryspecific('${email.text}');
    print(allrows);
    setState(() {
      previous_balance = allrows[0]['Balance'];
      current_balance = int.parse(previous_balance);
      print('The current balance of ${allrows[0]['Name']} is $current_balance');
      new_balance = current_balance + int.parse(balance.text);
      print('The new balance of ${allrows[0]['Name']} is $new_balance');
    });
    return new_balance;
  }

  void update() async {
    int new_bal = await queryspecific();
    var row = await dbhelper.update('${email.text}','${new_bal}');
    print('Updated: $row');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Sparks Bank'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: InputDecoration(
                labelText: "Enter customer email"
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: balance,
              decoration: InputDecoration(
                labelText: 'Enter amount'
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 30,),
            TextButton.icon(
              label: Text('Transfer'),
              style: TextButton.styleFrom(
                backgroundColor: Colors.teal,
                primary: Colors.white70,
                shadowColor: Colors.grey,
                elevation: 10,
              ),
              icon: Icon(Icons.send),
              onPressed: update,
            ),
          ],
        ),
      ),
    );
  }
}
