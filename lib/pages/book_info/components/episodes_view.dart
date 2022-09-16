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
  static int limit = 40;

  //最大数量
  int maxCount = 0;
  List<Episode> episodes = [];

  @override
  Widget build(BuildContext context) {
    //网格布局
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.start,
      children: List.generate(episodes.length, (index) {
        return ElevatedButton(
          style: ButtonStyle(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize: MaterialStateProperty.all(const Size(0, 0)),
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              //设置按下时的背景颜色
              if (states.contains(MaterialState.pressed)) {
                return Colors.pink;
              }
              //默认不使用背景颜色
              return Colors.pink[100];
            }),
          ),
          onPressed: () {
            //判断点击的是否是加载更多
            if (episodes[index].name == '...') {
              _getMore();
            } else {
              final Map<String, String> newQueries;
              newQueries = <String, String>{
                'page': page.toString(),
                'episodeCount': (index + 1).toString(),
              };
              context.pushNamed('browseView',
                  params: <String, String>{'bookId': super.widget.bookId},
                  queryParams: newQueries);
            }
            debugPrint('你点击的是$index 名字是：${episodes[index].name}');
          },
          child: Text(
            episodes[index].name,
            style: const TextStyle(
              color: Colors.pink,
              fontSize: 14,
            ),
            strutStyle: const StrutStyle(
              forceStrutHeight: true,
              leading: 0.5,
            ),
            textAlign: TextAlign.center,
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
      maxCount = bookEpisodesResult.data.eps.total;
      //去除掉更多按钮
      if (episodes.isNotEmpty && episodes.last.name == '...') {
        episodes.removeLast();
      }
      for (var item in list) {
        Episode it = Episode(
          id: item.id,
          name: item.title,
        );
        episodes.add(it);
      }
      //添加完相关数据后，判断是否需要添加更多按钮
      if (episodes.length < maxCount) {
        Episode it = Episode(
          id: '',
          name: '...',
        );
        episodes.add(it);
      }
    }
  }

  void _getMore() {
    if (super.widget.bookId.isEmpty) {
      return;
    }
    page++;
    DioUtil dioUtil = DioUtil.getInstance();
    var result = dioUtil.getBookEpisodes(super.widget.bookId, page);
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
}
