import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class BannerView extends StatelessWidget {
  // 声明一个list，存放image Widget
  final List<String> imageList;

  const BannerView({
    Key? key,
    required this.imageList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
      width: size.width,
      height: size.width * 0.56,
      child: Swiper(
        itemBuilder: _swiperBuilder,
        itemCount: imageList.length,
        pagination: const SwiperPagination(),
        control: const SwiperControl(),
      ),
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return FittedBox(
      fit: BoxFit.contain,
      child:
      CachedNetworkImage(
        imageUrl: imageList[index],
        fit: BoxFit.fill,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
