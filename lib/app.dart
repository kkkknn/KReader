import 'package:flutter/material.dart';
import 'package:kreader/pages/constants.dart';
import 'package:kreader/pages/home/classification/classification.dart';
import 'package:kreader/pages/home/main/main_page.dart';
import 'package:kreader/pages/home/myinfo.dart';

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
            MainPage(),
            Classification(),
            MyInfo(),
            Option(),
          ],
        ),
        bottomNavigationBar: Material(
          color: Config.primaryLightColor,
          child: TabBar(
            controller: controller,
            labelColor: Config.primaryColor,
            unselectedLabelColor:  Config.primaryColor26,
            indicatorColor: Config.primarySwatchColor[400],
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