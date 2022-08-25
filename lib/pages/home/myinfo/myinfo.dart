import 'package:flutter/material.dart';
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
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            BannerView(
              isSign: false,
            ),
            BookView(
              title: '已下载',
              data:  [
                Book(bookName: '图书1', id:'1',imageUrl: 'assets/test/book.jpg',author:'asdasdasd'),
                Book(bookName: '图书1', id:'1',imageUrl: 'assets/test/book.jpg',author:'asdasdasd'),
                Book(bookName: '图书1', id:'1',imageUrl: 'assets/test/book.jpg',author:'asdasdasd'),
                Book(bookName: '图书1', id:'1',imageUrl: 'assets/test/book.jpg',author:'asdasdasd'),
              ],
              onTap: onTap,
            ),
            BookView(
              title: '最近观看',
              data: [
                Book(bookName: '图书1', id:'1',imageUrl: 'assets/test/book.jpg',author:'asdasdasd'),
                Book(bookName: '图书1', id:'1',imageUrl: 'assets/test/book.jpg',author:'asdasdasd'),
                Book(bookName: '图书1', id:'1',imageUrl: 'assets/test/book.jpg',author:'asdasdasd'),
                Book(bookName: '图书1', id:'1',imageUrl: 'assets/test/book.jpg',author:'asdasdasd'),
                Book(bookName: '图书1', id:'1',imageUrl: 'assets/test/book.jpg',author:'asdasdasd'),
              ],
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }

  onTap(int index) {
    debugPrint("点击了 $index个");
  }
}
