import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:kreader/http/results/book_result.dart';
import 'package:kreader/http/results/search_book_result.dart';
import 'package:kreader/pages/public_components/search_bar.dart';
import 'package:kreader/pages/search/components/book_item.dart';
import 'package:kreader/pages/search/components/search_reasult_view.dart';

import '../../http/dio_util.dart';


class SearchPage extends StatefulWidget {
  String searchWord;
  String category;

  SearchPage({Key? key, required this.searchWord, required this.category,}) : super(key: key);

  @override
  SearchPageState createState() => SearchPageState();

}

class SearchPageState extends State<SearchPage> {
  List<BookItem> books = [];
  int pageCount=1;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                SearchBar(
                  searchWord: super.widget.searchWord,
                  hintLabel: "请输入要搜索的本子",
                  onTap: (String str) {
                    debugPrint('asdas');
                  },
                ),
                Expanded(
                  child: SearchResultView(
                    data: books,
                    onTap: _onTap,),
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

  @override
  void initState() {
    super.initState();
    if(super.widget.searchWord.isNotEmpty){

      _getSearchResultByKeyWord(super.widget.searchWord);
    }
    if(super.widget.category.isNotEmpty){

      _getSearchResultByCategory(super.widget.category);
    }
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

    var result = dioUtil.searchCategoryBook( category, '', pageCount);
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
