import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:kreader/http/request/user.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioUtil {
  final Dio _dio = Dio();

  //请求头常量
  static const String _nonce = "b1ab87b4800d4d4590a11701b8551afa";
  static const String _apiKey = "C69BAF41DA5ABD1FFEDC6D2FEA56B";
  static const String _secretKey =
      r"~d}$Q7$eIni=V)9\RK/P.RM4;9[7|@/CA}b~OW!3?EV`:<>M7pddUBL5n|0/*Cn";
  static const String _base = "https://picaapi.picacomic.com/";

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
    User user = User(name, password);
    Map<String,dynamic> map =user.toJson();
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
  Future<Response> getRecommend() async{
    var url='${_base}collections';
    debugPrint('eweee ：asads');
    debugPrint('eweee ：'+_dio.options.headers['authorization'].toString());
    Response response = await _httpReq(
      url,
      'GET',
      null,
    );

    debugPrint('获取到数据了 数据是：'+response.data);
    if (response.statusCode == 200) {
      if (response.data['message'] == 'success') {
        return response;
      }
    }
    return response;
  }

  Future<Response<dynamic>> _httpReq(String url,String method, Map<String,dynamic>? map) async {
    //时间戳添加
    var time = _currentTimeMillis();
    _dio.options.headers['time'] = time;

    //请求加密 HMAC-SHA256
    var str = '${url.replaceAll(_base, '')}$time${_nonce}${method}$_apiKey';
    String lowStr = str.toLowerCase();
    _dio.options.headers['signature'] = _hexdigest(lowStr);

    debugPrint('请求路径'+url);
    if(method=='POST'||method=='post'){
      return await _dio.post(
        url,
        data: map,
      );

    }

    if(method=='GET'||method=='get'){
      return await _dio.get(
        url,
        queryParameters: map,
      );

    }
    debugPrint("日了错误");
    //没有指定请求类型，直接抛出异常
    throw Error();
  }
}
