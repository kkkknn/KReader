import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:kreader/http/results/recommend_book_result.dart';
import 'package:kreader/pages/public_components/book.dart';

import '../../../../http/dio_util.dart';

class RecommendView extends StatefulWidget {
  const RecommendView({Key? key}) : super(key: key);

  @override
  RecommendViewState createState() => RecommendViewState();
}

class RecommendViewState extends State<RecommendView> {
  List<Book> recommendBookGod = [].cast<Book>();
  List<Book> recommendBookDemon = [].cast<Book>();
  String god = "";
  String demon = '';

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return recommendBookGod.isEmpty && recommendBookDemon.isEmpty
        ? const Text('暂无推荐')
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                god,
                style: const TextStyle(
                  color: Colors.pink,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                width: size.width,
                height: size.width / 2,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemExtent: size.width / 4,
                  itemCount: recommendBookGod.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () => _onTapGod(index),
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              child: CachedNetworkImage(
                                width: size.width / 4,
                                height: size.width / 4 *1.4,
                                imageUrl: recommendBookGod[index].imageUrl,
                                fit: BoxFit.contain,
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            Expanded(child: Text(
                              recommendBookGod[index].bookName,
                              style: const TextStyle(
                                fontSize: 10,
                              ),
                            )),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Text(
                demon,
                style: const TextStyle(
                  color: Colors.pink,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                width: size.width,
                height: size.width / 2,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemExtent: size.width / 4,
                  itemCount: recommendBookDemon.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () => _onTapDemon(index),
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              child: CachedNetworkImage(
                                width: size.width / 4,
                                height: size.width / 4 *1.4,
                                imageUrl: recommendBookDemon[index].imageUrl,
                                fit: BoxFit.contain,
                                errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                              ),
                            ),
                            Expanded(child: Text(
                              recommendBookDemon[index].bookName,
                              style: const TextStyle(
                                fontSize: 10,
                              ),
                            ),),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
  }

  //数据解析
  void _analysisData(RecommendBookResult? value) {
    if (value == null) {
      return;
    }
    //数据解析填充
    RecommendBookResult? bookResult = value;
    if (bookResult.code == 200 && bookResult.message == 'success') {
      List<Collections> bookList = bookResult.data.collections;
      int count = 0;
      for (var item in bookList) {
        List<Comics> comics = item.comics;
        var title = item.title;
        if (count == 0) {
          god = title;
          for (var comic in comics) {
            Book book = Book(
              bookName: comic.title,
              author: comic.author,
              id: comic.id,
              imageUrl: '${comic.thumb.fileServer}/static/${comic.thumb.path}',
            );
            recommendBookGod.add(book);
          }
        } else if (count == 1) {
          demon = title;
          for (var comic in comics) {
            Book book = Book(
              bookName: comic.title,
              author: comic.author,
              id: comic.id,
              imageUrl: '${comic.thumb.fileServer}/static/${comic.thumb.path}',
            );
            recommendBookDemon.add(book);
          }
        }
        count++;
      }
    }
  }

  void _getData() {
    //获取推荐
    debugPrint('初始化了');
    //开始请求获取神魔推荐
    DioUtil dioUtil = DioUtil.getInstance();
    var result = dioUtil.getRecommend();
    //请求成功，开始填充数据
    result.then((value) {
      //数据刷新
      setState(() {
        debugPrint('a获取到数据了');
        _analysisData(value);
      });
    }, onError: (e) {
      EasyLoading.showError('网络出错');
      debugPrint('网络出错$e');
    });
  }

  void _onTapGod(index) {
    debugPrint(
        "${recommendBookGod[index].bookName}||${recommendBookGod[index].id}");
    _jumpBookInfo(recommendBookGod[index].id);
  }

  void _onTapDemon(index) {
    debugPrint(
        "${recommendBookDemon[index].bookName}||${recommendBookDemon[index].id}");
    _jumpBookInfo(recommendBookDemon[index].id);
  }

  //跳转到图书详情
  void _jumpBookInfo(String id) {
    if (id.isEmpty) {
      return;
    }
    debugPrint('接收到消息，开始跳转到图书详情');
    context.push('/bookInfo/$id');
  }
}
