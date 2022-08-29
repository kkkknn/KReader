import 'package:flutter/material.dart';
import 'package:kreader/pages/constants.dart';
import 'package:kreader/pages/home/classification/components/classify.dart';

class ClassifyView extends StatelessWidget {
  List<Classify> data = [];
  Function onPress;

  ClassifyView({Key? key, required this.data, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Wrap(
      direction: Axis.horizontal,
      spacing: 30,
      runSpacing: 30,
      alignment: WrapAlignment.start,
      children: data
          .map(
            (e) => InkWell(
              onTap: () => _onTap(e.name),
              child: Container(
                  width: size.width / 4,
                  height: size.width / 4 + 30,
                  padding: EdgeInsets.zero,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: size.width / 4,
                          height: size.width / 4,
                          //超出部分，可裁剪
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.network(
                            e.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                  'assets/images/default/author.jpg');
                            },
                          ),
                        ),
                        Text(
                          e.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.pink,
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          )
          .toList(),
    );
  }

  _onTap(String key) {
    onPress(key);
  }
}
