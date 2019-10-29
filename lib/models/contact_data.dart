/**
 * Manages the data for our contacts
 */

import 'package:flutter/foundation.dart';
import 'contact.dart';
import 'package:hive/hive.dart';

class ContactsData extends ChangeNotifier {
  // Name our hive box for this data
  String _boxName = "contactsBox";

  // Initialize our list of contacts
  List<Contact> _contacts = [];

  /// Get Contacts
  /// Gets all contacts from the hive box and loads them into our state List
  void getContacts() async {
    var box = await Hive.openBox<Contact>(_boxName);

    // Update our provider state data with a hive read, and refresh the ui
    _contacts = box.values.toList();
    notifyListeners();
  }

  /// Get Contact
  /// Retrieves a specific contact from our state
  Contact getContact(index) {
    return _contacts[index];
  }

  /// Contact Count
  /// Returns the length of the contact array
  int get contactCount {
    return _contacts.length;
  }

  /// Add Contact
  /// - Saves contact data to Hive box persistent storage
  /// - Updates our List with the hive data by read
  /// - Notifies listeners to update the UI, which will be a consumer of the _contacts List
  void addContact(Contact newContact) async {
    var box = await Hive.openBox<Contact>(_boxName);

    // Add a contact to our box
    await box.add(newContact);

    // Update our provider state data with a hive read, and refresh the ui
    _contacts = box.values.toList();
    notifyListeners();
  }

  /// Delete Contact
  /// - Deletes the contact from Hive
  /// - Updates our List from Hive
  /// - Notifies listeners to update the UI
  void deleteContact(index) async {
    var box = await Hive.openBox<Contact>(_boxName);

    print("Box Keys: " + box.keys.toList().toString());
    print("Deleting Index " +
        index.toString() +
        " which has a box key value of: " +
        box.keys.toList()[index].toString());

    // Get key of box we want to delete
    var boxKey = box.keys.toList()[index];

    // Delete the contact from the box
    await box.delete(boxKey);

    // Update our provider state data with a hive read, and refresh the ui
    _contacts = box.values.toList();
    notifyListeners();
  }
}
