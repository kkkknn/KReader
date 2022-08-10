import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kreader/constants.dart';
import 'package:kreader/pages/components/round_button.dart';
import 'package:kreader/pages/welcome/components/background.dart';

class Body extends StatelessWidget{
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
            const Text(
              '哔咔漫画',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height*0.03,
            ),
            SvgPicture.asset(
              'assets/icons/chat.svg',
              height: size.height*0.45,
            ),
            SizedBox(
              height: size.height*0.05,
            ),
            RoundedButton(
              text: '登录',
              press: (){
              },
            ),
            RoundedButton(
              text: '注册',
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: (){
              },
            )
          ],
        ),
      ),
    );
  }
}

