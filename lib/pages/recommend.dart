import 'package:flutter/material.dart';

class Recommend extends StatefulWidget {
  const Recommend({Key? key}) : super(key: key);

  @override
  RecommendState createState() => RecommendState();
}

class RecommendState extends State<Recommend> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("主页"),
          backgroundColor: const Color.fromARGB(225, 119, 136, 213),
          centerTitle: true,
        ),
        body: const Center(
          child: Text("推荐"),
        ),
      ),
    );
  }
}