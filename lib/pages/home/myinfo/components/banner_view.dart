import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ai_progress/ai_progress.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kreader/http/dio_util.dart';
import 'package:kreader/http/results/user_info_result.dart';
import 'package:kreader/pages/constants.dart';
import 'package:kreader/pages/home/myinfo/components/user_profile.dart';
import 'package:like_button/like_button.dart';

class BannerView extends StatefulWidget {

  const BannerView({Key? key}) : super(key: key);

  @override
  BannerViewState createState() => BannerViewState();


}

class BannerViewState extends State<BannerView>{
  UserProfile userProfile=UserProfile();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.width * 0.75,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: size.width,
            height: size.width * 0.75,
            decoration: const BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(
                image: ExactAssetImage('assets/images/default/user_background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: (const Color.fromRGBO(0, 0, 0, 1)).withOpacity(0.1),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      width: size.width/3,
                      height:  size.width/3,
                      padding: const EdgeInsets.all(5),
                      child: AirCircularStateProgressIndicator(
                        size: Size(size.width/3, size.width/3),
                        value: userProfile.exp / (4 * userProfile.level),
                        pathColor: Colors.white,
                        valueColor: _getLevelColor(userProfile.level),
                        pathStrokeWidth: 5.0,
                        valueStrokeWidth: 5.0,
                        useCenter: false,
                        filled: false,
                      ),
                    ),
                    ClipOval(
                      child: Image.network(
                          userProfile.imageUrl,
                          width: size.width/3-20,
                          height: size.width/3-20,
                          fit: BoxFit.cover),
                    ),
                  ],
                ),
                Text(userProfile.name),
                Text(userProfile.nickname,style: const TextStyle(color: Colors.pink,fontSize: 12),),
                Text(userProfile.slogan,style: const TextStyle(color: Colors.grey,fontSize: 10),),
              ],
            ),
          ),

        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _getUserProfile();
  }

  //获取用户信息
  void _getUserProfile() {

    DioUtil dioUtil = DioUtil.getInstance();
    var result = dioUtil.getUserInfo();
    //请求成功，开始填充数据
    result.then((value) {
      setState(() {
        debugPrint('获取到用户信息数据了');
        _analysisUserInfoData(value);
      });
    }, onError: (e) {
      EasyLoading.showError('网络出错');
      debugPrint('网络出错$e');
    });
  }

  void _analysisUserInfoData(UserInfoResult value) {
    UserInfoResult userInfoResult=value;
    if(userInfoResult.code==200&&userInfoResult.message=='success'){
      //请求成功，开始写入数据，然后刷新页面
      User user=userInfoResult.data.user;
      userProfile.id=user.id;
      userProfile.name=user.name;
      userProfile.birthday=user.birthday;
      userProfile.email=user.email;
      userProfile.gender=user.gender;
      userProfile.nickname=user.title;
      userProfile.verified=user.verified;
      userProfile.exp=user.exp;
      userProfile.level=user.level;
      userProfile.characters=user.characters;
      userProfile.createTime=user.createdAt;
      userProfile.isPunched=user.isPunched;
      userProfile.slogan=user.slogan;
      userProfile.imageUrl="${user.avatar.fileServer}/static/${user.avatar.path}";

    }
  }

  //获取会员颜色
  _getLevelColor(int level) {
    Color color;
    switch(level){
      case 1:
        color=const Color.fromARGB(255, 222, 217, 197);
        break;
      case 2:
        color=const Color.fromARGB(255, 143, 210, 79);
        break;
      case 3:
        color=const Color.fromARGB(255, 148, 182, 217);
        break;
      case 4:
        color=const Color.fromARGB(255, 35, 129, 255);
        break;
      case 5:
        color=const Color.fromARGB(255, 178, 51, 244);
        break;
      case 6:
        color=const Color.fromARGB(255, 251, 127, 125);
        break;
      case 7:
        color=const Color.fromARGB(255, 253, 81, 81);
        break;
      case 8:
        color=const Color.fromARGB(255, 248, 238, 52);
        break;
      case 9:
        color=const Color.fromARGB(255, 247, 100, 42);
        break;
      default:
        color=Colors.white;
    }
    return color;
  }

}
