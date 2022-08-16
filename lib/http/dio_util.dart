import 'package:dio/dio.dart';
import 'package:kreader/http/request/user.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:convert/convert.dart';

class DioUtil {
  late Dio dio;

  //请求头常量
  static const String _nonce = "b1ab87b4800d4d4590a11701b8551afa";
  static const String _apiKey = "C69BAF41DA5ABD1FFEDC6D2FEA56B";
  static const String _secretKey =
      r"~d}$Q7$eIni=V)9\RK/P.RM4;9[7|@/CA}b~OW!3?EV`:<>M7pddUBL5n|0/*Cn";
  static const String _base = "https://picaapi.picacomic.com/";

  DioUtil._internal() {
    dio = Dio();
    dio.options = BaseOptions(
      baseUrl: _base,
      connectTimeout: 5000,
      receiveTimeout: 5000,
      headers: {
        'Accept': 'application/json',
        'api-key': _apiKey,
        "accept": "application/vnd.picacomic.com.v1+json",
        "app-channel": "2",
        "nonce": _nonce,
        "app-version": "2.2.1.2.3.3",
        "app-uuid": "defaultUuid",
        "app-platform": "android",
        "app-build-version": "44",
        "Content-Type": "application/json; charset=UTF-8",
        "User-Agent": "okhttp/3.8.1",
        "image-quality": "original",
        //"authorization":     "",
        //"signature":         "",
        //"time":              int(time()))
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
    User user = User(name, password);
    debugPrint(user.toJson().toString());
    var api = "auth/sign-in";
    var url = _base + api;

    Response response =  await _post(
      url,
      user.toJson().toString(),
    );
    dio.options.headers['authorization'] = response.data["data"]['token'];
    return true;
  }

  // 获取当前时间戳
  static String _currentTimeMillis() {
    return DateTime.now().microsecondsSinceEpoch.toString().substring(0,10);
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

  // post 命令
  Future<Response<dynamic>> _post(String url, String data) async {
    //时间戳添加
    var time = _currentTimeMillis();
    dio.options.headers['time'] = time;

    //请求加密 HMAC-SHA256
    var str = '${url.replaceAll(_base, '')}$time${_nonce}POST$_apiKey';
    String lowStr = str.toLowerCase();
    dio.options.headers['signature'] = _hexdigest(lowStr);

    return await dio.post(
      url,
      data: {'email': '18810836346', 'password': 'QQ2244355530'},
    );
  }
}
