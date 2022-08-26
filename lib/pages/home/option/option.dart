import 'package:flutter/material.dart';
import 'package:kreader/components/background.dart';

class Option extends StatefulWidget {
  const Option({Key? key}) : super(key: key);

  @override
  OptionState createState() => OptionState();
}

class OptionState extends State<Option> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        width: size.width,
        height: size.height,
        color: Colors.white,
        child: Container(
          alignment: Alignment.center,
          child: Text('设置'),
        ),
      ),
    );
  }
}
