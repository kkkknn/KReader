

import 'package:flutter/material.dart';
import 'package:kreader/pages/welcome/components/body.dart';

class WelcomePage extends StatelessWidget{
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: Body(),
    );
  }

}