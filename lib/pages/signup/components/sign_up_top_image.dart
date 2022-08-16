import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kreader/pages/constants.dart';


class SignUpPageTopImage extends StatelessWidget {
  const SignUpPageTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: Config.defaultPadding),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: Image.asset('assets/icons/logo.png',color: Config.primaryColor),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: Config.defaultPadding),
      ],
    );
  }
}
