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
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.start,
      children: list
          .map((e) => Ink(
                decoration: BoxDecoration(
                  color: Colors.pink[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () => onTap(e),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      e.toString(),
                      style: TextStyle(
                        color: Colors.pink,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }

  onTap(String key) {
    onPress(key);
  }
}
