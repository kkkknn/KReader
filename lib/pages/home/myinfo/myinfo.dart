import 'package:flutter/material.dart';
import 'package:kreader/components/background.dart';
import 'package:kreader/pages/public_components/book.dart';

import 'components/banner_view.dart';
import 'components/book_view.dart';

class MyInfo extends StatefulWidget {
  const MyInfo({Key? key}) : super(key: key);

  @override
  MyInfoState createState() => MyInfoState();
}

class MyInfoState extends State<MyInfo> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        width: size.width,
        height: size.height,
        color: Colors.white,
        child:SingleChildScrollView(
          child: Column(
            children: const [
              BannerView(),
            ],
          ),
        ),
      ),
    );
  }

  onTap(int index) {
    debugPrint("点击了 $index个");
  }
}
