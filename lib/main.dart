import 'package:flutter/material.dart';
import 'package:kreader/app.dart';
import 'package:kreader/pages/login/login_page.dart';
import 'package:kreader/pages/signup/signup_page.dart';
import 'package:kreader/pages/welcome/welcome_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        '/':(BuildContext context)=>const WelcomePage(),
        '/home':(BuildContext context)=>const App(),
        '/login':(BuildContext context)=>const LoginPage(),
        '/signup':(BuildContext context)=>const SignUpPage(),
      },
    );
  }
  
}
