import 'package:flutter/material.dart';
import 'package:hackathon_fatura/task.dart';
import 'package:hackathon_fatura/tasks/first_task/first_task_screen.dart';
import 'package:hackathon_fatura/tasks/second_task/second_task_screen.dart';
import 'package:hackathon_fatura/tasks/third_task/third_task_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fatura Hackathon',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final tasks = [
    Task(
        name: "First task",
        description: "Optimize build method",
        screen: FirstTaskScreen()),
    Task(
      name: "Second task",
      description: "Optimize build method",
      screen: SecondTaskScreen(),
    ),
    Task(
        name: "Third task",
        description: "Make movieApp",
        screen: ThirdTaskScreen())
  ];

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fatura Hackathon"),
      ),
      body: ListView.builder(
        itemBuilder: (_, index) => ListTile(
          title: Text(tasks[index].name),
          subtitle: Text(tasks[index].description),
          onTap: () {
            Navigator.of(context).push(tasks[index].screen);
          },
        ),
        itemCount: tasks.length,
      ),
    );
  }
}
