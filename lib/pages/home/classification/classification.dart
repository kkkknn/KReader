import 'package:flutter/material.dart';
import 'package:kreader/http/dio_util.dart';
import 'package:kreader/pages/home/classification/components/classify.dart';
import 'package:kreader/pages/home/classification/components/classify_view.dart';
import 'package:kreader/pages/home/classification/components/key_view.dart';
import 'package:kreader/pages/home/classification/components/search_bar.dart';

class Classification extends StatefulWidget {
  const Classification({Key? key}) : super(key: key);

  @override
  ClassificationState createState() => ClassificationState();
}

class ClassificationState extends State<Classification> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            //清除title左右padding，默认情况下会有一定的padding距离
            toolbarHeight: 44,
            //将高度定到44，设计稿的高度。为了方便适配，
            //推荐使用插件flutter_screenutil做屏幕的适配工作
            backgroundColor: Colors.white,
            elevation: 0,
            //由于title本身是接受一个widget，所以可以直接给他一个自定义的widget。
            title: const SearchBar(
              hintLabel: "请输入要搜索的本子",
            ),
          ),
          body: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              const Text('大家都在搜索的关键字',textAlign: TextAlign.left,),
              Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(4),
                child: KeyView(
                  list: const [
                    'abandonas按时',
                    '分类1',
                    '分类12',
                    '分类13',
                    '分类41',
                    '分类11231',
                    '分类1123123',
                  ],
                  onPress: (String key){
                    debugPrint('您点击的是'+key);
                  },
                )
              ),
              const Text('热门分类',textAlign: TextAlign.left,),
              Container(
                  alignment: Alignment.topCenter,
                  child: ClassifyView(
                    onPress: (String key){
                      debugPrint('您点击的是'+key);
                    },
                    datas: [
                      Classify(
                        '分类1',
                        'assets/test/author.jpg',
                      ),
                      Classify(
                        '分类2',
                        'assets/test/author.jpg',
                      ),
                      Classify(
                        '分类3',
                        'assets/test/author.jpg',
                      ),
                      Classify(
                        '分类4',
                        'assets/test/author.jpg',
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),
    );
  }


}
