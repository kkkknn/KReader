import 'package:flutter/material.dart';
import 'package:flutter_advanced_seekbar/flutter_advanced_seekbar.dart';

class TextPage extends StatelessWidget {
  const TextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () async {
            int? selectedIndex = await _showDialog(context);
            debugPrint("自定义底部弹层：选中了第$selectedIndex个选项");
          },
          child: const Text(
            '弹窗',
          ),
        ),
      ),
    );
  }

  //显示弹窗
  Future<int?> _showDialog(context) {
    return showModalBottomSheet<int>(
      backgroundColor: Colors.transparent,
      isScrollControlled: false,
      context: context,
      builder: (BuildContext context) {
        return Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          height: MediaQuery.of(context).size.height / 4.0,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
                child: Center(
                  child: Text(
                    '工具栏',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: AdvancedSeekBar(
                Colors.grey,
                10,
                Colors.pink,
                lineHeight: 10,
                defaultProgress: 50,
                scaleWhileDrag: true,
                percentSplit: 10,
                percentSplitColor: Colors.white,
                percentSplitWidth: 1,
                seekBarStarted: () {
                },
                seekBarProgress: (v) {
                },
                seekBarFinished: (v) {
                },
              ),),

            ],
          ),
        );
      },
    );
  }
}
