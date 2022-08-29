import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kreader/http/dio_util.dart';
import 'package:kreader/http/results/episodes_pictures_result.dart';
import 'package:kreader/pages/public_components/episode.dart';

class BrowsePage extends StatefulWidget {
  String bookId;
  String page;
  String episodeCount;

  BrowsePage(
      {Key? key,
      required this.bookId,
      required this.page,
      required this.episodeCount})
      : super(key: key);

  @override
  BrowsePageState createState() => BrowsePageState();
}

class BrowsePageState extends State<BrowsePage> {
  List<String> images = [];
  int imagePage = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: images.length,
        itemBuilder: _itemBuilder,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    debugPrint('开始获取图书列表信息');
    //获取当前章节图片列表
    _getPictures(super.widget.bookId, super.widget.episodeCount);
  }

  //通过章节ID，获取章节内图片链接
  void _getPictures(String bookId, String episodeCount) {
    if (episodeCount.isEmpty || bookId.isEmpty) {
      return;
    }
    DioUtil dioUtil = DioUtil.getInstance();
    var result = dioUtil.getEpisodePictures(bookId, episodeCount, imagePage);
    //请求成功，开始填充数据
    result.then((value) {
      setState(() {
        debugPrint('获取到图片数据了');
        _analysisEpisodePicturesData(value);
      });
    }, onError: (e) {
      EasyLoading.showError('网络出错');
      debugPrint('网络出错$e');
    });
  }

  //解析数据
  void _analysisEpisodePicturesData(EpisodesPicturesResult value) {
    EpisodesPicturesResult? episodesPicturesResult = value;
    if (episodesPicturesResult.code == 200 &&
        episodesPicturesResult.message == 'success') {
      List<Docs> data = episodesPicturesResult.data.pages.docs;
      for (var item in data) {
        var url = "${item.media.fileServer}/static/${item.media.path}";
        images.add(url);
      }
    }
  }

  Widget _itemBuilder(BuildContext context, int index) {
    Size size=MediaQuery.of(context).size;
    //todo :需要判断横屏竖屏情况

    return CachedNetworkImage(
      width: size.width,
      height: size.width*1.75,
      imageUrl: images[index],
      errorWidget: (context, url, error) => SizedBox(
        width: size.width,
        height: size.width*1.75,
        child: const Icon(Icons.error,),
      ),
    );
  }
}
