import 'package:flutter/material.dart';
import 'package:kreader/pages/constants.dart';
import 'package:kreader/pages/home/classification/components/classify.dart';

class ClassifyView extends StatelessWidget {
  List<Classify> datas = [];
  final Function onPress;

  ClassifyView({Key? key, required this.datas, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: datas
          .map((e) => Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Config.primaryLightColor,
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () => onTap(e.name),
                  child: Container(
                      width: 150,
                      height: 180,
                      padding: EdgeInsets.zero,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Column(
                          children: [
                            Image.network(
                              e.imageUrl,
                            ),
                            Text(
                              e.name,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )),
                ),
              ))
          .toList(),
    );
  }

  onTap(String key) {
    onPress(key);
  }
}
