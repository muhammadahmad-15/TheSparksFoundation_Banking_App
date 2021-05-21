import 'package:flutter/material.dart';
import 'db_helpter.dart';
class NewCustomer extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController balance = TextEditingController();
  final dbhelper = DatabaseHelper.instance;

  void insertData() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnName : '${name.text}',
      DatabaseHelper.columnEmail : '${email.text}',
      DatabaseHelper.columnBalance : '${balance.text}',
    };
    int id = await dbhelper.insert(row);
    print('Current row id: $id');
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
              controller: name,
              decoration: InputDecoration(
                labelText: 'Name'
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: email,
              decoration: InputDecoration(
                  labelText: 'Email'
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: balance,
              decoration: InputDecoration(
                  labelText: 'Current Balance'
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20,),
            TextButton.icon(
              label: Text('Add'),
              style: TextButton.styleFrom(
                backgroundColor: Colors.teal,
                primary: Colors.white70,
                shadowColor: Colors.grey,
                elevation: 10,
              ),
              icon: Icon(Icons.add),
              onPressed: insertData,
            ),
          ],
        ),
      ),
    );
  }
}
