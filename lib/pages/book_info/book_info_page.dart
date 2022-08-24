import 'package:flutter/material.dart';

class BookInfoPage extends StatefulWidget {
  String id;

  BookInfoPage({Key? key, required this.id}) : super(key: key);


  @override
  BookInfoPageState createState() => BookInfoPageState();

}
class BookInfoPageState extends State<BookInfoPage>{


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Text(id),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    //请求图书详情
    _getBookInfo();
  }

  void _getBookInfo(){
    
  }
}
