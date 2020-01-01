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

  // Holds our active contact
  Contact _activeContact;

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
  void deleteContact(key) async {
    var box = await Hive.openBox<Contact>(_boxName);

    await box.delete(key);

    // Update _contacts List with all box values
    _contacts = box.values.toList();

    print("Deleted contact with key: " + key.toString());

    // Update UI
    notifyListeners();
  }

  /// Edit Contact
  /// Overwrites our existing contact based on key with a brand new updated Contact object
  void editContact({Contact contact, int contactKey}) async {
    var box = await Hive.openBox<Contact>(_boxName);

    // Add a contact to our box
    await box.put(contactKey, contact);

    // Update _contacts List with all box values
    _contacts = box.values.toList();

    // Update activeContact
    _activeContact = box.get(contactKey);

    print('New Name Of Contact: ' + contact.name);

    // Update UI
    notifyListeners();
  }

  /// Set an active contact we can notify listeners for
  void setActiveContact(key) async {
    var box = await Hive.openBox<Contact>(_boxName);
    _activeContact = box.get(key);
    notifyListeners();
  }

  /// Get Active Contact
  Contact getActiveContact() {
    return _activeContact;
  }
}
