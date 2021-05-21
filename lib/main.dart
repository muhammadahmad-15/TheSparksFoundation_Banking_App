import 'package:flutter/material.dart';
import 'package:tsf_bank/allcustomers.dart';
import 'package:tsf_bank/transfermoney.dart';
import 'package:tsf_bank/viewcustomer.dart';

import 'db_helpter.dart';
import 'newcustomer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TSF Banking App",
      home:MyHomePage(),
      initialRoute: '/',
      routes: {
        '/newcustomer':(_) => NewCustomer(),
        '/allcustomers':(_) => AllCustomers(),
        '/transfermoney':(_) => TransferMoney(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dbhelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('The Sparks Bank'),
        backgroundColor:Colors.teal,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 30)),
            Image(
                image: AssetImage('assets/images/tsf.png'),
            ),
            SizedBox(height: 40),
            TextButton.icon(
                label: Text('Add Customer'),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.teal,
                  primary: Colors.white70,
                  shadowColor: Colors.grey,
                  elevation: 10,
                ),
                icon: Icon(Icons.account_circle_rounded),
                onPressed: () {
                  Navigator.of(context).pushNamed('/newcustomer');
                },
            ),
            TextButton.icon(
              label: Text('View All Customers'),
              style: TextButton.styleFrom(
                backgroundColor: Colors.teal,
                primary: Colors.white70,
                shadowColor: Colors.grey,
                elevation: 10,
              ),
              icon: Icon(Icons.workspaces_filled),
              onPressed: () {
                Navigator.of(context).pushNamed('/allcustomers');
              },
            ),
            TextButton.icon(
              label: Text('Transfer Money'),
              style: TextButton.styleFrom(
                backgroundColor: Colors.teal,
                primary: Colors.white70,
                shadowColor: Colors.grey,
                elevation: 10,
              ),
              icon: Icon(Icons.attach_money_rounded),
              onPressed: () {
                Navigator.of(context).pushNamed('/transfermoney');
              },
            ),
          ],
        ),
      ),
    );
  }
}

