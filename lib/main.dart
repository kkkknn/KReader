import 'package:flutter/material.dart';
import 'package:kreader/app.dart';
import 'package:kreader/pages/login.dart';
import 'package:kreader/pages/recommend.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/':(BuildContext context)=>const Login(),
        '/home':(BuildContext context)=>const App(),
        '/login':(BuildContext context)=>const Login(),
      },
    );
  }
  
}
