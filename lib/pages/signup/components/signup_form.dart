import 'package:flutter/material.dart';
import 'package:kreader/pages/constants.dart';
import 'package:kreader/pages/login/login_page.dart';

import '../../../components/already_have_an_account_acheck.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: Config.primaryColor,
            onSaved: (email) {},
            decoration: const InputDecoration(
              hintText: "请输入你的账号",
              prefixIcon: Padding(
                padding: EdgeInsets.all(Config.defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Config.defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: Config.primaryColor,
              decoration: const InputDecoration(
                hintText: "请输入你的密码",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(Config.defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: Config.defaultPadding / 2),
          Hero(
            tag: "signup_btn",
            child: ElevatedButton(
              style:  ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 20.0),
              ),
              onPressed: () {

              },
              child: const Text(
                "注册",
              ),
            ),
          ),
          const SizedBox(height: Config.defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginPage();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}