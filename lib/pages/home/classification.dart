import 'package:flutter/material.dart';

class Classification extends StatefulWidget {
  const Classification({Key? key}) : super(key: key);

  @override
  ClassificationState createState() => ClassificationState();
}

class ClassificationState extends State<Classification> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("分类"),
          backgroundColor: const Color.fromARGB(225, 119, 136, 213),
          centerTitle: true,
        ),
        body: const Center(
          child: Text("分类"),
        ),
      ),
    );
  }
}