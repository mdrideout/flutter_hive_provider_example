/**
 * Our contact data model
 */

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'contact.g.dart';

@HiveType(typeId: 0) // use Hive to generate a type adapter
class Contact extends HiveObject {
  // Define variables

  @HiveField(0)
  final String name;

  @HiveField(1)
  final String phone;

  @HiveField(2)
  final String email;

  // Constructor
  Contact({@required this.name, this.phone, this.email});
}
