import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_hive_example/models/contact_data.dart';
import 'package:flutter_hive_example/models/contact.dart';

class AddContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newContactName;
    String newContactEmail;
    String newContactPhone;

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Add A Contact'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Save',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            onPressed: () {
              Provider.of<ContactsData>(context).addContact(
                Contact(
                  name: (newContactName != null) ? newContactName : '',
                  email: (newContactEmail != null) ? newContactEmail : '',
                  phone: (newContactPhone != null) ? newContactPhone : '',
                ),
              );
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Name',
                ),
                onChanged: (nameV) {
                  newContactName = nameV;
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Phone',
                ),
                onChanged: (phoneV) {
                  newContactPhone = phoneV;
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
                onChanged: (emailV) {
                  newContactEmail = emailV;
                },
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
