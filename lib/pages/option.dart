import 'package:flutter/material.dart';

class Option extends StatefulWidget {
  const Option({Key? key}) : super(key: key);

  @override
  OptionState createState() => OptionState();
}

class OptionState extends State<Option> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("设置"),
          backgroundColor: const Color.fromARGB(225, 119, 136, 213),
          centerTitle: true,
        ),
        body: const Center(
          child: Text("设置"),
        ),
      ),
    );
  }
}