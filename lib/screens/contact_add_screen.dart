import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_hive_example/widgets/common_toast.dart';
import 'package:flutter_hive_example/models/contact_data.dart';
import 'package:flutter_hive_example/models/contact.dart';

class ContactAddScreen extends StatefulWidget {
  @override
  _ContactAddScreenState createState() => _ContactAddScreenState();
}

class _ContactAddScreenState extends State<ContactAddScreen> {
  String newContactName;
  String newContactEmail;
  String newContactPhone;

  void _addContact(context) {
    /// Validate the client name input
    if (newContactName == null) {
      commonToast("You must include a name.");
      return;
    }
    if (newContactName.length < 3) {
      commonToast("The name must be at least 3 characters.");
      return;
    }

    /// Save contact data, email and phone are optional - null values replaced by empty string
    Provider.of<ContactsData>(context, listen: false).addContact(
      Contact(
        name: newContactName,
        email: (newContactEmail != null) ? newContactEmail : '',
        phone: (newContactPhone != null) ? newContactPhone : '',
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
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
              _addContact(context);
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
                  setState(() {
                    newContactName = nameV;
                  });
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
                  setState(() {
                    newContactPhone = phoneV;
                  });
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
                  setState(() {
                    newContactEmail = emailV;
                  });
                },
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
