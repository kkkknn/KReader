import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:kreader/components/background.dart';
import 'package:kreader/http/dio_util.dart';
import 'package:kreader/http/results/category_result.dart';
import 'package:kreader/http/results/key_words_result.dart';
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
  List<Classify> classifies = [];
  List<String> hotKeyWords = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Expanded(
                child: Column(
              children: <Widget>[
                SearchBar(
                  searchWord: '',
                  hintLabel: "请输入要搜索的本子",
                  onTap: (String str) {
                    if (str.isNotEmpty) {
                      debugPrint("您搜索的是$str");
                      //跳转页面
                      context.push('/search/$str');
                    }
                  },
                ),
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          '大家都在搜索的关键字',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.pink,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        KeyView(
                          list: hotKeyWords,
                          onPress: (String key) {
                            debugPrint('您点击的是$key');
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          '热门分类',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.pink,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          child: ClassifyView(
                            onPress: (String key) {
                              debugPrint('您点击的是' + key);
                            },
                            data: classifies,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            )),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    //获取主目录
    _getCategories();
    //获取热门搜索
    _getHotKeyWords();
  }

  void _getCategories() {
    DioUtil dioUtil = DioUtil.getInstance();
    var result = dioUtil.getCategories();
    //请求成功，开始填充数据
    result.then((value) {
      //数据刷新
      setState(() {
        debugPrint('获取到目录数据了');
        _analysisCategoriesData(value);
      });
    }, onError: (e) {
      EasyLoading.showError('网络出错');
      debugPrint('网络出错$e');
    });
  }

  //解析目录数据
  void _analysisCategoriesData(CategoryResult value) {
    CategoryResult categoryResult = value;

    if (categoryResult.code == 200 && categoryResult.message == 'success') {
      List<Categories> data = categoryResult.data.categories;
      for (var item in data) {
        var id = item.id;
        var name = item.title;
        var imageUrl;
        if (item.id != null || item.title == '被褐懷玉') {
          imageUrl = "${item.thumb.fileServer}/static/${item.thumb.path}";
        } else {
          imageUrl = "${item.thumb.fileServer}${item.thumb.path}";
        }
        Classify classify = Classify(id, name, imageUrl);
        classifies.add(classify);
      }
    }
  }

  //获取热门关键词
  void _getHotKeyWords() {
    DioUtil dioUtil = DioUtil.getInstance();
    var result = dioUtil.getHotKeyWords();
    //请求成功，开始填充数据
    result.then((value) {
      //数据刷新
      setState(() {
        debugPrint('获取到热门关键词数据了');
        _analysisHotKeyWordsData(value);
      });
    }, onError: (e) {
      EasyLoading.showError('网络出错');
      debugPrint('网络出错$e');
    });
  }

  void _analysisHotKeyWordsData(KeyWordsResult value) {
    KeyWordsResult keyWordsResult = value;
    if (keyWordsResult.code == 200 && keyWordsResult.message == 'success') {
      hotKeyWords.addAll(keyWordsResult.data.keywords);
    }
  }
}
