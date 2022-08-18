import 'package:flutter/material.dart';

import '../../components/book.dart';
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
    return SingleChildScrollView(
      child: Column(
        children: [
          const BannerView(),
          BookView(
            title: '已下载',
            data: const [
              Book(bookName: '图书1', imageUrl: 'assets/test/book.jpg'),
              Book(bookName: '图书2', imageUrl: 'assets/test/book.jpg'),
              Book(bookName: '图书3', imageUrl: 'assets/test/book.jpg'),
              Book(bookName: '图书4', imageUrl: 'assets/test/book.jpg'),
            ],
            onTap: onTap,
          ),
          BookView(
            title: '最近观看',
            data: const [
              Book(bookName: '图书1', imageUrl: 'assets/test/book.jpg'),
              Book(bookName: '图书2', imageUrl: 'assets/test/book.jpg'),
              Book(bookName: '图书3', imageUrl: 'assets/test/book.jpg'),
              Book(bookName: '图书4', imageUrl: 'assets/test/book.jpg'),
            ],
            onTap: onTap,
          ),
        ],
      ),
    );
  }

  onTap(int index) {
    debugPrint("点击了 $index个");
  }
}