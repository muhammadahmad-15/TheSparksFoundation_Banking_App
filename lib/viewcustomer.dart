import 'package:flutter/material.dart';

import 'db_helpter.dart';
class ViewCustomer extends StatefulWidget {
  Map<String,dynamic> data;
  ViewCustomer(this.data);
  @override
  _ViewCustomerState createState() => _ViewCustomerState();
}
class _ViewCustomerState extends State<ViewCustomer> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Sparks Bank'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              title: Text('Name'),
              subtitle: Text(widget.data['Name'],style: TextStyle(fontSize: 16),),
            ),
            ListTile(
              title: Text('Email'),
              subtitle: Text(widget.data['Email'],style: TextStyle(fontSize: 16),),
            ),
            ListTile(
              title: Text('Balance'),
              subtitle: Text(widget.data['Balance'],style: TextStyle(fontSize: 16),),
            ),
          ]
        ).toList(),
      )
    );
  }
}
