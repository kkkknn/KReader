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
    Size size=MediaQuery.of(context).size;
    return Wrap(
      direction: Axis.horizontal,
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: data
          .map(
            (e) => InkWell(
              onTap: () => onTap(e.name),
              child: Container(
                  width: size.width/4,
                  height: size.width/4+30,
                  padding: EdgeInsets.zero,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: size.width/4,
                          height: size.width/4,
                          //超出部分，可裁剪
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.network(
                            e.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder:(context,error,stackTrace){
                              return Image.asset('assets/images/default/author.jpg');
                            },
                          ),
                        ),
                        Text(
                          e.name,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )),
            ),
          )
          .toList(),
    );
  }

  onTap(String key) {
    onPress(key);
  }
}
