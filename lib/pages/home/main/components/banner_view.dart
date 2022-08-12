import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';

class BannerView extends StatelessWidget {
  // 声明一个list，存放image Widget
  final List<Widget> imageList;

  const BannerView({Key? key,required this.imageList,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: Swiper(
        itemCount: 4,
        itemBuilder: _swiperBuilder,
        pagination: const SwiperPagination(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.fromLTRB(0, 0, 20, 10),
            builder: DotSwiperPaginationBuilder(
                color: Colors.black54,
                activeColor: Colors.white
            )
        ),
        controller: SwiperController(),
        scrollDirection: Axis.horizontal,
        autoplay: true,
        onTap: (index) => print('点击了第$index'),
      ),
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return (imageList[index]);
  }
}

