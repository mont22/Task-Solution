import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Task {
  String name;
  String description;
  late MaterialPageRoute screen;

  Task(
      {required this.name, required this.description, required Widget screen}) {
    this.screen = MaterialPageRoute(builder: (_) => screen);
  }
}
