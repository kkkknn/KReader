import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kreader/http/dio_util.dart';
import 'package:kreader/pages/home/classification/components/classify.dart';
import 'package:kreader/pages/home/classification/components/classify_view.dart';
import 'package:kreader/pages/home/classification/components/key_view.dart';
import 'package:kreader/pages/public_components/search_bar.dart';
import 'package:kreader/pages/search/search_page.dart';

class Classification extends StatefulWidget {
  const Classification({Key? key}) : super(key: key);

  @override
  ClassificationState createState() => ClassificationState();
}

class ClassificationState extends State<Classification> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBar(
              searchWord: '',
              hintLabel: "请输入要搜索的本子",
              onTap: (String str) {
                if(str.isNotEmpty){
                  debugPrint("您搜索的是$str");
                  //跳转页面
                  context.push('/search/$str');
                }
              },
            ),
            const Text(
              '大家都在搜索的关键字',
              textAlign: TextAlign.left,
            ),
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
                    '分类11231',
                    '分类1123123',
                    '分类11231',
                    '分类1123123',
                  ],
                  onPress: (String key) {
                    debugPrint('您点击的是' + key);
                  },
                )),
            const Text(
              '热门分类',
              textAlign: TextAlign.left,
            ),
            Container(
                alignment: Alignment.topCenter,
                child: ClassifyView(
                  onPress: (String key) {
                    debugPrint('您点击的是' + key);
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
                    Classify(
                      '分类4',
                      'assets/test/author.jpg',
                    ),
                    Classify(
                      '分类4',
                      'assets/test/author.jpg',
                    ),
                    Classify(
                      '分类4',
                      'assets/test/author.jpg',
                    ),
                    Classify(
                      '分类4',
                      'assets/test/author.jpg',
                    ),
                    Classify(
                      '分类4',
                      'assets/test/author.jpg',
                    ),
                    Classify(
                      '分类4',
                      'assets/test/author.jpg',
                    ),
                    Classify(
                      '分类4',
                      'assets/test/author.jpg',
                    ),
                    Classify(
                      '分类4',
                      'assets/test/author.jpg',
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
