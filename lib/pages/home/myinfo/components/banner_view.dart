import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ai_progress/ai_progress.dart';
import 'package:like_button/like_button.dart';

class BannerView extends StatelessWidget {
  bool isSign=false;

  BannerView({Key? key,required this.isSign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.width * 0.75,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: size.width,
            height: size.width * 0.75,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(124, 127, 115, .3),
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://img0.utuku.imgcdc.com/500x0/game/20210107/9186c1b5-3b35-40ea-a34a-b8f486dad358.png'),
                  fit: BoxFit.cover,
                )),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), //可以看源码
              child: Container(
                decoration: BoxDecoration(
                  color: (Color.fromRGBO(0, 0, 0, 1)).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
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
                Text('lv3 (670/1200)'),
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      width: 150,
                      height: 150,
                      padding: EdgeInsets.all(5),
                      child: AirCircularStateProgressIndicator(
                        size: Size(150, 150),
                        value: 7 / 10 * 100,
                        pathColor: Colors.white,
                        valueColor: Colors.orange,
                        pathStrokeWidth: 5.0,
                        valueStrokeWidth: 5.0,
                        useCenter: false,
                        filled: false,
                      ),
                    ),
                    ClipOval(
                      child: Image.network(
                          'https://img0.utuku.imgcdc.com/500x0/game/20210107/9186c1b5-3b35-40ea-a34a-b8f486dad358.png',
                          width: 130,
                          height: 130,
                          fit: BoxFit.cover),
                    ),
                  ],
                ),
                Text('昵称'),
                Text('账号类别'),
                Text('介绍'),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Padding(
                padding: EdgeInsets.all(size.width/20),
                child:TextButton(
                  style: ButtonStyle(
                    backgroundColor: createTextBtnBgColor(),
                  ),
                  onPressed: (){
                    isSign = !isSign;
                    debugPrint('点击签到了');
                  },
                  child: const Text('签到',style: TextStyle(color: Colors.blue),),
                ),
            ),
          ),

        ],
      ),
    );
  }

  MaterialStateProperty<Color> createTextBtnBgColor() {

    return MaterialStateProperty.resolveWith((states) {
      if(isSign){
        return Colors.pink;
      }else if (states.contains(MaterialState.pressed)) {
        return Colors.pink;
      } else if (states.contains(MaterialState.disabled)) {
        return Colors.grey;
      }
      return Colors.grey;
    });
  }

}
