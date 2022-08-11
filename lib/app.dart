import 'package:flutter/material.dart';
import 'package:kreader/pages/home/classification.dart';
import 'package:kreader/pages/home/myinfo.dart';
import 'package:kreader/pages/home/recommend.dart';

import 'pages/home/option/option.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: TabBarView(
          controller: controller,
          children: const <Widget>[
            Recommend(),
            Classification(),
            MyInfo(),
            Option(),
          ],
        ),
        bottomNavigationBar: Material(
          color: Colors.white,
          child: TabBar(
            controller: controller,
            labelColor: Colors.deepPurpleAccent,
            unselectedLabelColor: Colors.black26,
            tabs: const <Widget>[
              Tab(
                text: "推荐",
                icon: Icon(Icons.home),
              ),
              Tab(
                text: "分类",
                icon: Icon(Icons.category),
              ),
              Tab(
                text: "我的",
                icon: Icon(Icons.person),
              ),
              Tab(
                text: "设置",
                icon: Icon(Icons.settings),
              ),
            ],
          ),
        ),
      ),
    );
  }
}