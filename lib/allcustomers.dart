import 'package:flutter/material.dart';
import 'package:tsf_bank/viewcustomer.dart';

import 'db_helpter.dart';
class AllCustomers extends StatefulWidget {
  @override
  _AllCustomersState createState() => _AllCustomersState();
}

class _AllCustomersState extends State<AllCustomers> {

  final dbhelper = DatabaseHelper.instance;
  List<Map> customersList = [];
  bool isPressed = false;
  void queryAll() async {
    var allrows = await dbhelper.queryall();
    setState(() {
      allrows.forEach((row) {
        customersList.add(row);
      });
      isPressed = true;
    });
    print(customersList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Sparks Bank'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: [
          Column(
          children: [
            (!isPressed) ? TextButton(
              child: Text('View Customers',style: TextStyle(
                color: Colors.teal
              ),),
              onPressed: queryAll,
            ) : Container(),
            (customersList.length > 0 ) ? Column(
              children: [
                for(var items in customersList) ListTile(
                  leading: Icon(
                    Icons.account_circle_rounded
                  ),
                  title: Text(items['Name'],style: TextStyle(
                    fontSize: 20,
                  ),),
                  subtitle: Text(items['Balance']),
                  trailing: Icon(Icons.navigate_next),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ViewCustomer(items)),
                    );
                  },
                )
              ],
            ) : Text("Nothing to display"),
          ],
        ),
        ]
      ),
    );
  }
}
