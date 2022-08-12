import 'package:flutter/material.dart';
import 'package:kreader/pages/home/classification/components/search_bar.dart';

class Classification extends StatefulWidget {
  const Classification({Key? key}) : super(key: key);

  @override
  ClassificationState createState() => ClassificationState();
}

class ClassificationState extends State<Classification> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            titleSpacing: 0,  //清除title左右padding，默认情况下会有一定的padding距离
            toolbarHeight: 44, //将高度定到44，设计稿的高度。为了方便适配，
            //推荐使用插件flutter_screenutil做屏幕的适配工作
            backgroundColor: Colors.white,
            elevation: 0,
            //由于title本身是接受一个widget，所以可以直接给他一个自定义的widget。
            title: const SearchBar(
              hintLabel: "电影/电视剧/影人",
            ),
        ),
        body: const Center(
          child: Text("分类"),
        ),
      ),
    );
  }
}