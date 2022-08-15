
//单例模式 dio 框架
import 'package:dio/dio.dart';

class DioUtil{
  var dio;
  late BaseOptions options;

  //请求头常量
  static const String _nonce = "b1ab87b4800d4d4590a11701b8551afa";
  static const String _apiKey = "C69BAF41DA5ABD1FFEDC6D2FEA56B";
  static const String _secretKey = r"~d}$Q7$eIni=V)9\RK/P.RM4;9[7|@/CA}b~OW!3?EV`:<>M7pddUBL5n|0/*Cn";
  static const String _base = "https://picaapi.picacomic.com/";


  DioUtil._internal(){
    dio = Dio();
    options = BaseOptions(
      baseUrl: _base,
      connectTimeout: 5000,
      receiveTimeout: 5000,
      headers: {
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

  static getInstance(){
    return instance;
  }

  factory DioUtil()=>getInstance();

  Future<Response> login(String name,String password) async {
    //json拼接

    return await dio.post(
        '/auth/sign-in',
        data: {
          'id': 12,
          'name': 'wendu'
        },
      option
    );
  }

}