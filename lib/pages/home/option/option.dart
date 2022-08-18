import 'package:flutter/material.dart';
import 'package:kreader/pages/components/book.dart';
import 'package:kreader/pages/home/main/components/recommend_view.dart';

class Option extends StatefulWidget {
  const Option({Key? key}) : super(key: key);

  @override
  OptionState createState() => OptionState();
}

class OptionState extends State<Option> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            child: Text('设置'),
        ),
    );
  }
}