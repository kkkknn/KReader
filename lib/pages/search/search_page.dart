import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_load_more/easy_load_more.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:kreader/http/results/book_result.dart';
import 'package:kreader/http/results/search_book_result.dart';
import 'package:kreader/pages/public_components/search_bar.dart';
import 'package:kreader/pages/search/components/book_item.dart';

import '../../http/dio_util.dart';

class SearchPage extends StatefulWidget {
  String searchWord;
  String category;

  SearchPage({
    Key? key,
    required this.searchWord,
    required this.category,
  }) : super(key: key);

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  List<BookItem> books = [];
  int pageCount = 1;
  static int limit = 20;
  int searchSize = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          color:Colors.white,
          width: size.width,
          height: size.height - 40,
          child: Flex(direction: Axis.vertical, children: <Widget>[
            SearchBar(
              searchWord: super.widget.searchWord,
              hintLabel: "请输入要搜索的本子",
              onTap: (String str) {
                debugPrint('asdas');
              },
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: _refresh,
                child: EasyLoadMore(
                  isFinished: books.length >= searchSize,
                  onLoadMore: _loadMore,
                  runOnEmptyResult: false,
                  child: ListView.builder(
                    itemCount: books.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: _cellForRow,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  _onTap(int index) {
    //携参跳转到图书详情
    debugPrint('选中了$index 接收到消息，开始跳转到图书详情');
    context.push('/bookInfo/${books[index].bookId}');
  }

  Widget _cellForRow(BuildContext context, int index) {
    final size = MediaQuery.of(context).size;
    final List<String> categories = books[index].categories;
    return InkWell(
        onTap: () {
          _onTap(index);
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: size.width,
            height: size.height / 8,
            child: Row(
              children: <Widget>[
                SizedBox(
                  child: CachedNetworkImage(
                    width: size.height / 8 * 0.75,
                    height: size.height / 8,
                    imageUrl: books[index].imageUrl,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          books[index].bookName,
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            books[index].author,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 8.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            itemBuilder: (BuildContext context, int index2) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  categories[index2],
                                  style: const TextStyle(
                                    color: Colors.pink,
                                    fontSize: 10,
                                  ),
                                  strutStyle: const StrutStyle(
                                    forceStrutHeight: true,
                                    leading: 0.5,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
    if (super.widget.searchWord.isNotEmpty) {
      _getSearchResultByKeyWord(super.widget.searchWord);
    }
    if (super.widget.category.isNotEmpty) {
      _getSearchResultByCategory(super.widget.category);
    }
  }

  Future<bool> _loadMore() async {
    pageCount++;
    if (super.widget.searchWord.isNotEmpty) {
      _getSearchResultByKeyWord(super.widget.searchWord);
    }
    if (super.widget.category.isNotEmpty) {
      _getSearchResultByCategory(super.widget.category);
    }

    debugPrint("加载更多");
    await Future.delayed(
      const Duration(
        seconds: 0,
        milliseconds: 2000,
      ),
    );

    return true;
  }

  Future<void> _refresh() async {
    books.clear();
    if (super.widget.searchWord.isNotEmpty) {
      _getSearchResultByKeyWord(super.widget.searchWord);
    }
    if (super.widget.category.isNotEmpty) {
      _getSearchResultByCategory(super.widget.category);
    }
    await Future.delayed(
      const Duration(
        seconds: 0,
        milliseconds: 2000,
      ),
    );
  }

  //搜索图书 通过关键词
  void _getSearchResultByKeyWord(String searchWord) {
    DioUtil dioUtil = DioUtil.getInstance();

    var result = dioUtil.searchBook(searchWord, '', pageCount);
    //请求成功，开始填充数据
    result.then((value) {
      //数据刷新 防止报错，延迟加载下
      setState(() {
        _analysisSearchData(value);
      });
    }, onError: (e) {
      EasyLoading.showError('网络出错');
      debugPrint('网络出错$e');
    });
  }

  void _getSearchResultByCategory(String category) {
    DioUtil dioUtil = DioUtil.getInstance();

    var result = dioUtil.searchCategoryBook(category, '', pageCount);
    //请求成功，开始填充数据
    result.then((value) {
      //数据刷新 防止报错，延迟加载下
      setState(() {
        _analysisSearchData(value);
      });
    }, onError: (e) {
      EasyLoading.showError('网络出错');
      debugPrint('网络出错$e');
    });
  }

  void _analysisSearchData(SearchBookResult value) {
    if (value.code == 200 && value.message == 'success') {
      List<Docs> data = value.data.comics.docs;
      searchSize = value.data.comics.total;
      for (var item in data) {
        BookItem bookItem = BookItem(
          bookId: item.id,
          bookName: item.title,
          author: item.author,
          isFinish: item.finished,
          likeCount: item.likesCount,
          searchCount: item.totalViews,
          categories: item.categories,
          imageUrl: '${item.thumb.fileServer}/static/${item.thumb.path}',
        );

        //添加数据到list内
        books.add(bookItem);
      }
    }
  }
}
