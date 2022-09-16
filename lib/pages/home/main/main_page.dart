import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kreader/components/background.dart';
import 'package:kreader/pages/home/main/components/banner_view.dart';
import 'package:kreader/pages/home/main/components/recommend_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return SafeArea(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child:SingleChildScrollView(
          child: Column(
            children: const [
              BannerView(
                imageList: [
                  'https://img0.utuku.imgcdc.com/500x0/game/20210107/9186c1b5-3b35-40ea-a34a-b8f486dad358.png',
                  'https://img3.utuku.imgcdc.com/500x0/game/20210107/f36193cb-3500-478c-83e3-81b8862c7f05.png',
                  'https://img0.utuku.imgcdc.com/500x0/game/20210107/4b542d2a-d592-4158-9543-71e789a3a3f0.png',
                  'https://img2.utuku.imgcdc.com/500x0/game/20210107/0376c039-36eb-40f9-a51e-383424490654.png',
                ],
              ),
              RecommendView(),
            ],
          ),
        ),
      ),
    );
  }
}
