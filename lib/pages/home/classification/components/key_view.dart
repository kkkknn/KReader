import 'package:flutter/material.dart';
import 'package:kreader/pages/constants.dart';

class KeyView extends StatelessWidget {
  List list = [];
  final Function onPress;

  KeyView({Key? key, required this.list, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 2,
      runSpacing: 2,
      alignment: WrapAlignment.start,
      children: list
          .map(
            (e) => ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(
                          10))),
                padding: MaterialStateProperty.all(EdgeInsets.all(5)),
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    //设置按下时的背景颜色
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.pink;
                    }
                    //默认不使用背景颜色
                    return Colors.pink[100];
                  }),
              ),
              onPressed: () => onTap(e),
              child: Text(
                e.toString(),
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
          )
          .toList(),
    );
  }

  onTap(String key) {
    onPress(key);
  }
}
