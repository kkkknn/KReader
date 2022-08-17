import 'package:flutter/material.dart';

import 'components/banner_view.dart';

class MyInfo extends StatefulWidget {
  const MyInfo({Key? key}) : super(key: key);

  @override
  MyInfoState createState() => MyInfoState();
}

class MyInfoState extends State<MyInfo> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          BannerView(),
          Text('已下载'),
          Text('最近观看')
        ],
      ),
    );
  }
}