import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("登录"),
          backgroundColor: const Color.fromARGB(225, 119, 136, 213),
          centerTitle: true,
        ),
        body: Center(
          child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
                debugPrint('asdas');
              },
              child: const Text('登录'))
        )
      ),
    );
  }
}