import 'dart:math';

import 'package:flutter/material.dart';

/*
 Second Task : app consists of FAB and container
 when i pressed on FAB it changes container Color
 but when i pressed on FAB it Rebuild Background widget
 which it doesn't no need to rebuild
 you need to optimize build function as
 when i pressed on Button don't rebuild Background widget
 */
class SecondTaskScreen extends StatefulWidget {
  @override
  _SecondTaskScreenState createState() => _SecondTaskScreenState();
}

class BackgroundWidget extends StatelessWidget {
  final Widget child;

  const BackgroundWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    print("Building BackgroundWidget");

    return Container(color: Colors.amber, child: child);
  }
}

class _SecondTaskScreenState extends State<SecondTaskScreen> {
  ValueNotifier<Color> _notifier = ValueNotifier(Colors.black);
  //Color _randomColor = Colors.black;
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    print("Building SecondTaskScreen");
    return Scaffold(
      appBar: AppBar(
        title: Text("Second task"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _notifier.value =
              Colors.primaries[_random.nextInt(Colors.primaries.length)];
          /*setState(() {
            _randomColor =
                Colors.primaries[_random.nextInt(Colors.primaries.length)];
          });*/
        },
        child: Icon(Icons.colorize),
      ),
      body: BackgroundWidget(
          child: Center(
        child: ValueListenableBuilder(
            valueListenable: _notifier,
            builder: (BuildContext context, Color val, Widget? child) {
              return Container(
                width: 100,
                height: 100,
                color: val,
              );
            }),
      )),
    );
  }

  @override
  void dispose() {
    _notifier.dispose();
    super.dispose();
  }
}
