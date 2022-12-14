import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:kreader/components/background.dart';
import 'package:kreader/http/results/book_result.dart';
import 'package:kreader/http/results/like_or_favorite_result.dart';
import 'package:kreader/pages/book_info/components/episodes_view.dart';
import 'package:like_button/like_button.dart';

import '../../http/dio_util.dart';
import '../constants.dart';
import 'components/book_info.dart';

class BookInfoPage extends StatefulWidget {
  String id;

  BookInfoPage({Key? key, required this.id}) : super(key: key);

  @override
  BookInfoPageState createState() => BookInfoPageState();
}

class BookInfoPageState extends State<BookInfoPage> {
  //默认空的图书详情
  BookInfo bookInfo = BookInfo();

  final double buttonSize = 36;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return SafeArea(
      child: Container(
        color: Colors.white,
        width: width,
        height: height,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width / 3,
                      height: width / 3 * 1.75,
                      child: CachedNetworkImage(
                        width: width / 3,
                        height: width / 3 * 1.75,
                        fit: BoxFit.contain,
                        imageUrl: bookInfo.bookImageUrl,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              bookInfo.bookName,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.pink),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width / 15,
                                  height: width / 15,
                                  child: ClipOval(
                                    child: CachedNetworkImage(
                                      width: width / 15,
                                      height: width / 15,
                                      imageUrl: bookInfo.authorImageUrl,
                                      fit: BoxFit.contain,
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  bookInfo.author,
                                  style: const TextStyle(
                                    color: Colors.pink,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 20),
                            child: Text(
                              '上传时间: ${bookInfo.createTime}',
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.grey),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 20),
                            child: Text(
                              '最近更新: ${bookInfo.updateTime}',
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.grey),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: LikeButton(
                                    onTap: _onLikeButtonTapped,
                                    size: buttonSize,
                                    circleColor: const CircleColor(
                                        start: Color(0xff00ddff),
                                        end: Color(0xff0099cc)),
                                    bubblesColor: const BubblesColor(
                                      dotPrimaryColor: Color(0xff33b5e5),
                                      dotSecondaryColor: Color(0xff0099cc),
                                    ),
                                    isLiked: bookInfo.isLiked,
                                    likeBuilder: (bool isLiked) {
                                      return Icon(
                                        Icons.favorite,
                                        color: isLiked
                                            ? Colors.deepPurpleAccent
                                            : Colors.grey,
                                        size: buttonSize,
                                      );
                                    },
                                    likeCount: bookInfo.likeCount,
                                    countBuilder: (int? count, bool isLiked,
                                        String text) {
                                      var color = isLiked
                                          ? Colors.deepPurpleAccent
                                          : Colors.grey;
                                      return Text(
                                        text,
                                        style: TextStyle(color: color),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: LikeButton(
                                    onTap: _onFavoriteButtonTapped,
                                    size: buttonSize,
                                    circleColor: const CircleColor(
                                        start: Color(0xff00ddff),
                                        end: Color(0xff0099cc)),
                                    bubblesColor: const BubblesColor(
                                      dotPrimaryColor: Color(0xff33b5e5),
                                      dotSecondaryColor: Color(0xff0099cc),
                                    ),
                                    isLiked: bookInfo.isFavourite,
                                    likeBuilder: (bool isLiked) {
                                      return Icon(
                                        Icons.star,
                                        color: isLiked
                                            ? Colors.deepPurpleAccent
                                            : Colors.grey,
                                        size: buttonSize,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 20),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Config.primaryColor,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 40.0, vertical: 10.0),
                                        elevation: 0),
                                    onPressed: () {},
                                    child: const Text(
                                      '开始阅读',
                                      style: TextStyle(),
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '标签：',
                      style: TextStyle(fontSize: 18, color: Colors.pink),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Wrap(
                        direction: Axis.horizontal,
                        spacing: 8,
                        runSpacing: 8,
                        alignment: WrapAlignment.start,
                        children: List.generate(
                          bookInfo.tags.length,
                          (index) => ElevatedButton(
                            style: ButtonStyle(
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              minimumSize:
                                  MaterialStateProperty.all(Size(0, 0)),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10)),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith((states) {
                                //设置按下时的背景颜色
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.pink;
                                }
                                //默认不使用背景颜色
                                return Colors.pink[100];
                              }),
                            ),
                            onPressed: () => _onTapTag(index),
                            child: Text(
                              bookInfo.tags[index],
                              style: const TextStyle(
                                color: Colors.pink,
                                fontSize: 12,
                              ),
                              strutStyle: const StrutStyle(
                                forceStrutHeight: true,
                                leading: 0.5,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '简介：',
                      style: TextStyle(fontSize: 18, color: Colors.pink),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: bookInfo.description == ""
                          ? const Text('暂无简介')
                          : Text(bookInfo.description),
                    ),
                  ],
                ),
              ),
              bookInfo.bookId.isEmpty
                  ? const Text('正在获取数据')
                  : EpisodesView(bookId: bookInfo.bookId),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    //请求图书详情
    _getBookInfo(super.widget.id);
  }

  void _getBookInfo(String id) {
    if (id.isEmpty) {
      return;
    }
    DioUtil dioUtil = DioUtil.getInstance();
    var result = dioUtil.getBookInfo(id);
    //请求成功，开始填充数据
    result.then((value) {
      setState(() {
        debugPrint('获取到图书详情数据了');
        _analysisBookInfoData(value);
      });
    }, onError: (e) {
      EasyLoading.showError('网络出错');
      debugPrint('网络出错$e');
    });
  }

  //解析数据
  void _analysisBookInfoData(BookResult value) {
    BookResult? bookResult = value;
    if (bookResult.code == 200 && bookResult.message == 'success') {
      Comic comic = bookResult.data.comic;
      bookInfo.bookId = comic.id;
      bookInfo.bookName = comic.title;
      bookInfo.author = comic.author;
      bookInfo.description = comic.description;
      bookInfo.bookImageUrl =
          "${comic.thumb.fileServer}/static/${comic.thumb.path}";
      bookInfo.categories = comic.categories;
      bookInfo.tags = comic.tags;
      bookInfo.finished = comic.finished;
      bookInfo.updateTime = _dateFormat(comic.updatedAt);
      bookInfo.createTime = _dateFormat(comic.createdAt);
      bookInfo.likeCount = comic.likesCount;
      bookInfo.viewCount = comic.viewsCount;
      bookInfo.commentsCount = comic.commentsCount;
      bookInfo.isLiked = comic.isLiked;
      bookInfo.isFavourite = comic.isFavourite;
      bookInfo.authorImageUrl =
          "${comic.creator.avatar.fileServer}/static/${comic.creator.avatar.path}";
    }
  }

  //日期字符串格式化
  String _dateFormat(String str) {
    DateTime updateTime = DateTime.parse(str);
    var year = updateTime.year;
    var month = updateTime.month;
    var day = updateTime.day;
    var hour = updateTime.hour < 10 ? '0${updateTime.hour}' : updateTime.hour;
    var minute =
        updateTime.minute < 10 ? '0${updateTime.minute}' : updateTime.minute;
    var second =
        updateTime.second < 10 ? '0${updateTime.second}' : updateTime.second;
    return "$year-$month-$day $hour:$minute:$second";
  }

  //选择了标签
  _onTapTag(int index) {
    debugPrint('选择了${bookInfo.tags[index]}');
    //路由跳转 传递参数出现汉子或特殊字符 会出现找不到路由情况 需要Uri.encodeComponent 编码做字符转义
    final Map<String, String> newQueries;
    newQueries = <String, String>{
      'searchWord': bookInfo.tags[index],
      'category': '',
    };
    //跳转页面  2个参数， 关键词/分类
    context.pushNamed('search', queryParams: newQueries);
  }

  Future<bool?> _onLikeButtonTapped(bool isLiked) async {
    /// send your request here
    DioUtil dioUtil = DioUtil.getInstance();

    LikeOrFavoriteResult likeOrFavoriteResult =
        await dioUtil.likeBook(bookInfo.bookId);
    //请求成功，开始填充数据
    if (likeOrFavoriteResult.code == 200 &&
        likeOrFavoriteResult.message == 'success') {
      return !isLiked;
    } else {
      return isLiked;
    }
  }

  Future<bool?> _onFavoriteButtonTapped(bool isLiked) async {
    DioUtil dioUtil = DioUtil.getInstance();
    LikeOrFavoriteResult likeOrFavoriteResult =
        await dioUtil.favoriteBook(bookInfo.bookId);
    //请求成功，开始填充数据
    if (likeOrFavoriteResult.code == 200 &&
        likeOrFavoriteResult.message == 'success') {
      return !isLiked;
    } else {
      return isLiked;
    }
  }
}
