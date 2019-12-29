// The display of a single contact

import 'package:flutter/material.dart';
import 'package:flutter_hive_example/screens/contact_view_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_hive_example/models/contact.dart';
import 'package:flutter_hive_example/models/contact_data.dart';

class ContactTile extends StatelessWidget {
  final int tileIndex;

  // Constructor
  ContactTile({this.tileIndex});

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactsData>(
      builder: (context, contactData, child) {
        Contact currentContact = contactData.getContact(tileIndex);

        return ListTile(
          title: Text(
            currentContact.name,
          ),
          onTap: () {
            Provider.of<ContactsData>(context, listen: false)
                .setActiveContact(currentContact.key);

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ContactViewScreen();
              }),
            );
          },
        );
      },
    );
  }
}
