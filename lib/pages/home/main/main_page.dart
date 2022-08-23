import 'package:flutter/material.dart';
import 'package:kreader/http/dio_util.dart';
import 'package:kreader/pages/home/main/components/banner_view.dart';
import 'package:kreader/pages/components/book.dart';
import 'package:kreader/pages/home/main/components/recommend_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  //图书数组
  List<Book> recommendBookGod = [];
  List<Book> recommendBookDemon = [];

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
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

            /*RecommendView(
              title: '本子魔推荐',
              data: recommendBookDemon,
              onTap: _onTapDemon,
            ),*/
          ],
        ),
      ),
    );
  }

  _onTapGod(int index) {
    debugPrint("神点击3了 $index个");
  }

  _onTapDemon(int index) {
    debugPrint("魔点击3了 $index个");
  }

  @override
  void initState() {
    super.initState();
    debugPrint('初始化了');
    //开始请求获取神魔推荐
    DioUtil dioUtil = DioUtil.getInstance();
    var result = dioUtil.getRecommend();
    //请求成功，开始填充数据
    result.then((value) {
      //数据解析填充
    }, onError: (e) {
      debugPrint('网络出错'+e.toString());
    });
  }
}
