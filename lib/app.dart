import 'package:flutter/material.dart';
import 'package:kreader/pages/constants.dart';
import 'package:kreader/pages/home/classification/classification.dart';
import 'package:kreader/pages/home/main/main_page.dart';
import 'package:kreader/pages/home/myinfo/myinfo.dart';
import 'package:proste_indexed_stack/proste_indexed_stack.dart';

import 'pages/home/option/option.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> with SingleTickerProviderStateMixin {

//底部导航栏数组
  final items = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.home), label: '首页', tooltip: ''),
    const BottomNavigationBarItem(
        icon: Icon(Icons.category), label: '分类', tooltip: ''),
    const BottomNavigationBarItem(
        icon: Icon(Icons.person), label: '我的', tooltip: ''),
    const BottomNavigationBarItem(
        icon: Icon(Icons.settings), label: '设置', tooltip: ''),
  ];

  //底部导航栏页面
  final bodyList = [
    IndexedStackChild(child: const MainPage()),
    IndexedStackChild(child: const Classification()),
    IndexedStackChild(child: const MyInfo()),
    IndexedStackChild(child: const Option()),
  ];

  //当前选中页面索引
  int _currentIndex = 0;

  //底部导航栏切换
  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ProsteIndexedStack(
          index: _currentIndex,
          children: bodyList,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Config.primaryLightColor,
          selectedItemColor: Config.primarySwatchColor[400],
          items: items,
          currentIndex: _currentIndex, //当前选中标识符
          onTap: _onTap,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
