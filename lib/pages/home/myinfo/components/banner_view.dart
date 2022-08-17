import 'dart:ui';

import 'package:flutter/material.dart';

class BannerView extends StatelessWidget {

  const BannerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Container(
      width: size.width,
      height: size.width * 0.75,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SizedBox(
            width: size.width,
            child: Container(
              width: size.width,
              height: size.width * 0.75,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(124, 127, 115, .3),
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: NetworkImage('https://img0.utuku.imgcdc.com/500x0/game/20210107/9186c1b5-3b35-40ea-a34a-b8f486dad358.png'),
                    fit: BoxFit.cover,
                  )
              ),

            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3), //可以看源码
              child: Container(
                decoration: BoxDecoration(
                  color: (Color.fromRGBO(225, 225, 225, 1)).withOpacity(0.06),
                  borderRadius: BorderRadius.circular(20),
                ),

              ),
            ),
          ),
          Column(
            children: [
              Text('lv3 (670/1200)'),
              Text('原型image'),
              Text('昵称'),
              Text('账号类别'),
              Text('介绍'),
            ],
          ),
        ],
      ),
    );
  }

}