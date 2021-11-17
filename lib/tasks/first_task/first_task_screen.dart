import 'dart:math';

import 'package:flutter/material.dart';

/*
 First Task : app consists of FAB and container
 when i pressed on FAB it changes container Color
 but when i pressed on FAB it Rebuild Background widget
 which it doesn't no need to rebuild
 you need to optimize build function as
 when i pressed on Button don't rebuild Background widget
 */
class FirstTaskScreen extends StatefulWidget {
  @override
  _FirstTaskScreenState createState() => _FirstTaskScreenState();
}

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget();
  @override
  Widget build(BuildContext context) {
    print("Building BackgroundWidget");

    return Container(color: Colors.amber);
  }
}

class _FirstTaskScreenState extends State<FirstTaskScreen> {
  Color _randomColor = Colors.black;
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    print("Building FirstTaskScreen");
    return Scaffold(
      appBar: AppBar(
        title: Text("First task"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _randomColor =
                Colors.primaries[_random.nextInt(Colors.primaries.length)];
          });
        },
        child: Icon(Icons.colorize),
      ),
      body: Stack(
        children: [
          Positioned.fill(child: const BackgroundWidget()),
          Center(
            child: Container(
              width: 100,
              height: 100,
              color: _randomColor,
            ),
          )
        ],
      ),
    );
  }
}
