import 'package:flutter/material.dart';
import 'package:kreader/pages/public_components/episode.dart';

class BrowsePage extends StatefulWidget {
  String bookId;
  String page;
  String browCount;

  BrowsePage(
      {Key? key,
      required this.bookId,
      required this.page,
      required this.browCount})
      : super(key: key);

  @override
  BrowsePageState createState() => BrowsePageState();
}

class BrowsePageState extends State<BrowsePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: const [
            Text("asdasdasdsa"),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
