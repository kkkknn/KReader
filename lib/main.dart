import 'package:flutter/material.dart';
import 'package:kreader/app.dart';
import 'package:kreader/pages/constants.dart';
import 'package:kreader/pages/login/login_page.dart';
import 'package:kreader/pages/search/search_page.dart';
import 'package:kreader/pages/signup/signup_page.dart';
import 'package:kreader/pages/welcome/welcome_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


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
        primarySwatch: Config.primarySwatchColor,
        scaffoldBackgroundColor: Config.primaryLightColor,
      ),
      routes: {
        '/':(BuildContext context)=>const WelcomePage(),
        '/home':(BuildContext context)=>const App(),
        '/login':(BuildContext context)=>const LoginPage(),
        '/signup':(BuildContext context)=>const SignUpPage(),
      },
      builder: EasyLoading.init(),
    );
  }
  
}
