import 'package:flutter/material.dart';

class BookInfoPage extends StatelessWidget {
  String id;

  BookInfoPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Text(id),
      ),
    );
  }
}
