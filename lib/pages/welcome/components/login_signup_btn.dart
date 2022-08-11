import 'package:flutter/material.dart';
import 'package:kreader/pages/constants.dart';


class LoginAndSignupBtn extends StatelessWidget {
  const LoginAndSignupBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: "login_btn",
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            style: ElevatedButton.styleFrom(
                primary: kPrimaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 20.0),
                elevation: 0
            ),
            child: const Text(
              '登录',
            ),
          ),
        ),
        const SizedBox(height: 16),
        Hero(
            tag: ('signup_btn'),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              style: ElevatedButton.styleFrom(
                  primary: kPrimaryLightColor,
                  padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 20.0),
                  elevation: 0
              ),
              child: const Text(
                '注册',
                style: TextStyle(color: Colors.black),
              ),
            ),
        ),

      ],
    );
  }
}
