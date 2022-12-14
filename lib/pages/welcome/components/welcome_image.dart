import 'package:flutter/material.dart';
import 'package:kreader/pages/constants.dart';


class WelcomeImage extends StatelessWidget {
  const WelcomeImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        const SizedBox(height: Config.defaultPadding * 2),
      ],
    );
  }
}