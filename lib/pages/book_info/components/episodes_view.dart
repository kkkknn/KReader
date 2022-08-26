import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:kreader/http/results/book_episodes_result.dart';
import 'package:kreader/pages/public_components/episode.dart';

import '../../../http/dio_util.dart';

class EpisodesView extends StatefulWidget {
  late String bookId;

  EpisodesView({Key? key, required this.bookId}) : super(key: key);

  @override
  EpisodesViewState createState() => EpisodesViewState();
}

class EpisodesViewState extends State<EpisodesView> {
  //当前页
  int page = 1;

  //最大页数
  int maxPage = 1;
  List<Episode> episodes = [];

  @override
  Widget build(BuildContext context) {
    //网格布局
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.start,
      children: List.generate(episodes.length, (index) {
        return GestureDetector(
          onTap: () {
            final Map<String, String> newQueries;
            newQueries = <String, String>{
              'page': page.toString(),
              'episodeCount': (index+1).toString(),
            };
            debugPrint('你点击的是${episodes[index].name}');
            context.pushNamed('browseView',
                params: <String, String>{'bookId': super.widget.bookId},
                queryParams: newQueries);
          },
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  episodes[index].name,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    //获取漫画分话
    _getEpisodesData(super.widget.bookId);
  }

  void _getEpisodesData(String bookId) {
    debugPrint("开始请求");
    if (bookId.isEmpty) {
      return;
    }
    DioUtil dioUtil = DioUtil.getInstance();
    var result = dioUtil.getBookEpisodes(bookId, page);
    //请求成功，开始填充数据
    result.then((value) {
      setState(() {
        debugPrint('获取到图书集数数据了');
        _analysisBookEpisodesData(value);
      });
    }, onError: (e) {
      EasyLoading.showError('网络出错');
      debugPrint('网络出错$e');
    });
  }

  void _analysisBookEpisodesData(BookEpisodesResult value) {
    BookEpisodesResult? bookEpisodesResult = value;
    if (bookEpisodesResult.code == 200 &&
        bookEpisodesResult.message == 'success') {
      List<Docs> list = bookEpisodesResult.data.eps.docs;
      for (var item in list) {
        Episode it = Episode(
          id: item.id,
          name: item.title,
        );
        episodes.add(it);
      }
    }
  }
}
