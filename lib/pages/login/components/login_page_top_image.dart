import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kreader/pages/constants.dart';


class LoginPageTopImage extends StatelessWidget {
  const LoginPageTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: Config.defaultPadding * 2),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: SvgPicture.asset("assets/icons/logo.svg",
                color: Config.primaryLightColor,),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: Config.defaultPadding * 2),
      ],
    );
  }
}