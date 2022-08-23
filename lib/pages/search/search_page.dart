import 'package:flutter/material.dart';
import 'package:kreader/http/results/book_result.dart';
import 'package:kreader/pages/search/components/search_book_result.dart';
import 'package:kreader/pages/search/components/search_reasult_view.dart';

import '../components/search_bar.dart';

class SearchPage extends StatelessWidget {
  String searchWord;

  SearchPage( {Key? key,required this.searchWord,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child:Scaffold(
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SearchBar(
              searchWord:searchWord,
              hintLabel: "请输入要搜索的本子",
              onTap: (String str) {
                debugPrint('asdas');
              },
            ),
            Expanded(
              child: SearchResultView(data: [
                SearchBookResult(
                  bookName: '私を満たすもの番外編-放課後まで待てない- (COMIC LO 2013年12月号) [中国翻訳]',
                  isFinish: true,
                  author: "彦馬ヒロユキ",
                  imageUrl:
                  "assets/icons/logo.png",
                  likeCount: 286,
                  searchCount: 12932,
                  categories: ["短篇", "NTR", "強暴", "妹妹系"],
                ),
                SearchBookResult(
                  bookName: '私を満たすもの番外編-放課後まで待てない- (COMIC LO 2013年12月号) [中国翻訳]',
                  isFinish: true,
                  author: "彦馬ヒロユキ",
                  imageUrl:
                  "assets/test/book.jpg",
                  likeCount: 286,
                  searchCount: 12932,
                  categories: ["短篇", "NTR", "強暴", "妹妹系"],
                ),
                SearchBookResult(
                  bookName: '私を満たすもの番外編-放課後まで待てない- (COMIC LO 2013年12月号) [中国翻訳]',
                  isFinish: true,
                  author: "彦馬ヒロユキ",
                  imageUrl:
                  "assets/test/book.jpg",
                  likeCount: 286,
                  searchCount: 12932,
                  categories: ["短篇", "NTR", "強暴", "妹妹系"],
                ),

              ], onTap: _onTap),
            ),
          ]),
        ) ,
      ),
    );
  }

  _onTap(int index) {
    //携参跳转到详情

    debugPrint('选中了$index');
  }
}
