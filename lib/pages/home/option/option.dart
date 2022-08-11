import 'package:flutter/material.dart';

class Option extends StatefulWidget {
  const Option({Key? key}) : super(key: key);

  @override
  OptionState createState() => OptionState();
}

class OptionState extends State<Option> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Padding
            (
              padding: const EdgeInsets.all(4.0),
              child: Card
                (
                elevation: 18,
                shape: RoundedRectangleBorder
                  (
                    borderRadius: BorderRadius.circular(20)
                ),

                child: Padding
                  (
                  padding: const EdgeInsets.all(4.0),
                  child: Image.network(
                    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fblog%2F202107%2F20%2F20210720111353_cbad1.thumb.1000_0.jpg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1662798445&t=386745675d4092e37cc0dc6cdd56a761",

                  ),
                ),
              )
          ),
          const Text('设置2',),
          Card(
            color: Colors.yellow,
            child: Image.network(
              'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fblog%2F202107%2F20%2F20210720111353_cbad1.thumb.1000_0.jpg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1662798445&t=386745675d4092e37cc0dc6cdd56a761',
              width: 100,
              height: 100,
            ),
            ),
        ],
      )
    );
  }
}