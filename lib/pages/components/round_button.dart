import 'package:flutter/material.dart';

import '../../constants.dart';

class RoundedButton extends StatelessWidget{
  final String text;
  final void Function() press;
  final Color color,textColor;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color=kPrimaryColor,
    this.textColor = Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10,),
      width: size.width*0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 20,horizontal: 40)),
            foregroundColor: MaterialStateProperty.resolveWith(
                  (states) {
                if (states.contains(MaterialState.focused) &&
                    !states.contains(MaterialState.pressed)) {
                  //获取焦点时的颜色
                  return Colors.blue;
                } else if (states.contains(MaterialState.pressed)) {
                  //按下时的颜色
                  return Colors.deepPurple;
                }
                //默认状态使用灰色
                return textColor;
              },
            ),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
               //设置按下时的背景颜色
               if (states.contains(MaterialState.pressed)) {
                 return Colors.purple;
               }
              //默认不使用背景颜色
              return color;
            }),
          ),
            onPressed: press,
            child: Text(text)),
      ),
    );
  }

}