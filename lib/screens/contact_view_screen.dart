import 'package:flutter/material.dart';
import 'package:flutter_hive_example/screens/contact_edit_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_hive_example/models/contact_data.dart';
import 'package:flutter_hive_example/models/contact.dart';

class ContactViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Delete confirmation dialogue
    void _showDeleteConfirmation(currentClient) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Are You Sure?"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                      'You are about to delete ${currentClient.name} and all of their content.'),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'You cannot undo this action.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Delete'),
                onPressed: () {
                  print("Deleting ${currentClient.name}...");
                  Provider.of<ContactsData>(context, listen: false)
                      .deleteContact(currentClient.key);
                  Navigator.popUntil(
                      context, ModalRoute.withName(Navigator.defaultRouteName));
                },
              ),
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  print("Canceled delete.");
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Consumer<ContactsData>(builder: (context, contactData, child) {
      Contact currentContact = contactData.getActiveContact();

      return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(currentContact.name),
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (selection) {
                switch (selection) {
                  case 1:
                    print("Selected Edit");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ContactEditScreen(
                            currentContact: currentContact,
                          );
                        },
                      ),
                    );
                    break;

                  case 2:
                    print("Selected Delete");
                    _showDeleteConfirmation(currentContact);
                    break;
                }
              },
              itemBuilder: (context) => <PopupMenuEntry>[
                PopupMenuItem(
                  child: Text("Edit"),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text("Delete"),
                  value: 2,
                ),
              ],
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Text(currentContact.email),
                Text(currentContact.phone),
              ],
            ),
          ),
        ),
      );
    });
  }
}
