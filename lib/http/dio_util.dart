
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:kreader/http/results/book_episodes_result.dart';
import 'package:kreader/http/results/book_result.dart';
import 'package:kreader/http/results/category_result.dart';
import 'package:kreader/http/results/episodes_pictures_result.dart';
import 'package:kreader/http/results/key_words_result.dart';
import 'package:kreader/http/results/recommend_book_result.dart';
import 'package:kreader/http/results/search_book_result.dart';
import 'package:kreader/http/results/user_info_result.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioUtil {
  final Dio _dio = Dio();

  //请求头常量
  static const String _nonce = "b1ab87b4800d4d4590a11701b8551afa";
  static const String _apiKey = "C69BAF41DA5ABD1FFEDC6D2FEA56B";
  static const String _secretKey =
      r"~d}$Q7$eIni=V)9\RK/P.RM4;9[7|@/CA}b~OW!3?EV`:<>M7pddUBL5n|0/*Cn";
  static const String _base = "https://picaapi.picacomic.com/";
  //static const String _base = "http://68.183.234.72/";
  //static const String _base = "http://206.189.95.169/";

  DioUtil._internal() {

    _dio.options = BaseOptions(
      validateStatus: (_) => true,
      responseType:ResponseType.json,
      connectTimeout: 5000,
      receiveTimeout: 5000,
      headers: {
        'Accept': 'application/json',
        'api-key': _apiKey,
        "accept": "application/vnd.picacomic.com.v1+json",
        "app-channel": "1",
        "nonce": _nonce,
        "app-version": "2.2.1.2.3.3",
        "app-uuid": "defaultUuid",
        "app-platform": "android",
        "app-build-version": "44",
        'Content-Type': 'application/json; charset=UTF-8',
        "User-Agent": "okhttp/3.8.1",
        "image-quality": "original",
        /*"authorization":     "",
        "signature":         "",
        "time":             '',*/
      },
    );

  }

  static DioUtil instance = DioUtil._internal();

  static getInstance() {
    return instance;
  }

  factory DioUtil() => getInstance();

  Future<bool> login(String name, String password) async {
    //json拼接
    final Map<String,dynamic> map = <String, dynamic>{
      'email':name,
      'password':password,
    };

    var api = "auth/sign-in";
    var url = _base + api;

    Response response = await _httpReq(
      url,
      'POST',
      map,
    );
    if (response.statusCode == 200) {
      if (response.data['message'] == 'success') {
        var token=response.data['data']['token'];
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        //写入dio
        _dio.options.headers['authorization']=token;
        debugPrint('写入成功');
        return true;
      }
    }

    return false;
  }

  // 获取当前时间戳
  static String _currentTimeMillis() {
    return DateTime.now().microsecondsSinceEpoch.toString().substring(0, 10);
  }

  static Digest _hexdigest(String str) {
    var key = utf8.encode(_secretKey);
    var bytes = utf8.encode(str);

    var hmacSha256 = Hmac(sha256, key); // HMAC-SHA256
    var output = AccumulatorSink<Digest>();
    var input = hmacSha256.startChunkedConversion(output);
    input.add(bytes);
    input.close();
    var digest = output.events.single;

    return digest;
  }

  void setToken(String token) {
    _dio.options.headers['authorization'] = token;
  }

  //获取神魔推荐
  Future<RecommendBookResult?> getRecommend() async{
    var url='${_base}collections';
    Response response = await _httpReq(
      url,
      'GET',
      null,
    );
    return RecommendBookResult.fromJson(response.data);
  }

  //获取图书详情
  Future<BookResult> getBookInfo(String id) async{
    var url='${_base}comics/$id';
    Response response = await _httpReq(
      url,
      'GET',
      null,
    );
    return BookResult.fromJson(response.data);
  }

  //获取漫画的分话
  Future<BookEpisodesResult> getBookEpisodes(String id,int page) async{
    var url='${_base}comics/$id/eps?page=$page';
    Response response = await _httpReq(
      url,
      'GET',
      null,
    );
    return BookEpisodesResult.fromJson(response.data);
  }

  //获取漫画图片
  Future<EpisodesPicturesResult> getEpisodePictures(String bookId,String episodeCount,int page) async{
    var url='${_base}comics/$bookId/order/$episodeCount/pages?page=$page';
    Response response = await _httpReq(
      url,
      'GET',
      null,
    );
    return EpisodesPicturesResult.fromJson(response.data);
  }

  //获取账户个人信息
  Future<UserInfoResult> getUserInfo() async{
    var url='${_base}users/profile';
    Response response = await _httpReq(
      url,
      'GET',
      null,
    );
    debugPrint(response.data.toString());
    return UserInfoResult.fromJson(response.data);
  }

  //获取所有分类
  Future<CategoryResult> getCategories() async{
    var url='${_base}categories';
    Response response = await _httpReq(
      url,
      'GET',
      null,
    );
    return CategoryResult.fromJson(response.data);
  }

  //获取热搜关键词
  Future<KeyWordsResult> getHotKeyWords() async{
    var url='${_base}keywords';
    Response response = await _httpReq(
      url,
      'GET',
      null,
    );
    return KeyWordsResult.fromJson(response.data);
  }

  //搜索
  Future<SearchBookResult> searchBook(String searchWord,String sort,int page) async{
    var url='${_base}comics/advanced-search?page=$page';

    Map<String,dynamic> map=<String,dynamic>{
      "sort": sort.isEmpty?'ua':sort,
      "keyword": searchWord.isEmpty?'':searchWord,
    };


    debugPrint(map.toString());
    Response response = await _httpReq(
        url,
        'POST',
        map);
    debugPrint(response.data.toString());
    return SearchBookResult.fromJson(response.data);
  }

  //分类搜索
  Future<SearchBookResult> searchCategoryBook(String categories,String sort,int page) async{
    var str=sort.isEmpty?'ua':sort;
    var cate=Uri.encodeComponent(categories);
    var url='${_base}comics?page=$page&c=$cate&s=$str';

    Response response = await _httpReq(
        url,
        'GET',
        null);
    debugPrint(response.data.toString());
    return SearchBookResult.fromJson(response.data);
  }

  //喜欢漫画

  //收藏漫画

  //修改自我介绍


  Future<Response<dynamic>> _httpReq(String url,String method, Map<String,dynamic>? map) async {
    //时间戳添加
    var time = _currentTimeMillis();
    _dio.options.headers['time'] = time;

    //请求加密 HMAC-SHA256
    var str = '${url.replaceAll(_base, '')}$time$_nonce$method$_apiKey';
    String lowStr = str.toLowerCase();
    _dio.options.headers['signature'] = _hexdigest(lowStr);

    if(method=='POST'||method=='post'){
      debugPrint('POST 请求路径$url');
      return await _dio.post(
        url,
        data: map,
      );
    }

    if(method=='GET'||method=='get'){
      debugPrint('GET 请求路径$url');
      return await _dio.get(
        url,
        queryParameters: map,
      );

    }
    //没有指定请求类型，直接抛出异常
    throw Error();
  }

}
