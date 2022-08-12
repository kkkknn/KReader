import 'package:flutter/material.dart';
import 'package:kreader/pages/home/main/components/banner_view.dart';
import 'package:kreader/pages/home/main/components/book.dart';
import 'package:kreader/pages/home/main/components/recommend_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child:Column(
          children: [
            BannerView(
              imageList: [
                Image.network(
                  'https://img0.utuku.imgcdc.com/500x0/game/20210107/9186c1b5-3b35-40ea-a34a-b8f486dad358.png',
                  fit: BoxFit.fill,
                ),
                Image.network(
                  'https://img3.utuku.imgcdc.com/500x0/game/20210107/f36193cb-3500-478c-83e3-81b8862c7f05.png',
                  fit: BoxFit.fill,
                ),
                Image.network(
                  'https://img0.utuku.imgcdc.com/500x0/game/20210107/4b542d2a-d592-4158-9543-71e789a3a3f0.png',
                  fit: BoxFit.fill,
                ),
                Image.network(
                  'https://img2.utuku.imgcdc.com/500x0/game/20210107/0376c039-36eb-40f9-a51e-383424490654.png',
                  fit: BoxFit.fill,
                ),
              ],
            ),
            RecommendView(
              title: '本子神推荐',
              data: [
                Book(bookName: '图书1', imageUrl: 'https://img2.utuku.imgcdc.com/500x0/game/20210107/0376c039-36eb-40f9-a51e-383424490654.png'),
                Book(bookName: '图书2', imageUrl: 'https://img3.utuku.imgcdc.com/500x0/game/20210107/f36193cb-3500-478c-83e3-81b8862c7f05.png'),
                Book(bookName: '图书3', imageUrl: 'https://img3.utuku.imgcdc.com/500x0/game/20210107/f36193cb-3500-478c-83e3-81b8862c7f05.png'),
                Book(bookName: '图书4', imageUrl: 'https://img0.utuku.imgcdc.com/500x0/game/20210107/4b542d2a-d592-4158-9543-71e789a3a3f0.png'),
              ],
              onTap: onTap,
            ),
            RecommendView(
              title: '本子魔推荐',
              data: [
                Book(bookName: '图书1', imageUrl: 'https://img2.utuku.imgcdc.com/500x0/game/20210107/0376c039-36eb-40f9-a51e-383424490654.png'),
                Book(bookName: '图书2', imageUrl: 'https://img3.utuku.imgcdc.com/500x0/game/20210107/f36193cb-3500-478c-83e3-81b8862c7f05.png'),
                Book(bookName: '图书3', imageUrl: 'https://img3.utuku.imgcdc.com/500x0/game/20210107/f36193cb-3500-478c-83e3-81b8862c7f05.png'),
                Book(bookName: '图书4', imageUrl: 'https://img0.utuku.imgcdc.com/500x0/game/20210107/4b542d2a-d592-4158-9543-71e789a3a3f0.png'),
              ],
              onTap: onTap,
            ),

          ],
        ),
      ),
    );
  }

  onTap(int index){
    debugPrint("点击了 "+index.toString()+"个");
  }


}