import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_hive_example/models/contact_data.dart';
import 'package:flutter_hive_example/models/contact.dart';

class ContactViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Contacts'),
      ),
      body: Center(
        child: Text("Contact View Screen"),
      ),
    );
  }
}
