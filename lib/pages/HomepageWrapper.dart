import 'package:flutter/material.dart';
import 'package:iot_project/db/Database.dart';
import 'package:iot_project/pages/Homepage.dart'; // Make sure to import Homepage

class HomepageWrapper extends StatefulWidget {
  final String username;
  final List<dynamic> smartDevices;
  final Database db;

  HomepageWrapper({required this.username, required this.smartDevices, required this.db});

  @override
  State createState() => Homepage(this.username, this.smartDevices,this.db);
}
