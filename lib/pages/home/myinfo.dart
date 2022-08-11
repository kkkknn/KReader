import 'package:flutter/material.dart';

class MyInfo extends StatefulWidget {
  const MyInfo({Key? key}) : super(key: key);

  @override
  MyInfoState createState() => MyInfoState();
}

class MyInfoState extends State<MyInfo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("我"),
          backgroundColor: const Color.fromARGB(225, 119, 136, 213),
          centerTitle: true,
        ),
        body: const Center(
          child: Text("我11"),
        ),
      ),
    );
  }
}