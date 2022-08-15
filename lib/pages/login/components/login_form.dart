import 'package:flutter/material.dart';
import 'package:kreader/pages/constants.dart';
import 'package:kreader/pages/signup/signup_page.dart';

import '../../../components/already_have_an_account_acheck.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: Config.primaryColor,
            onSaved: (email) {},
            decoration: const InputDecoration(
              hintText: "请输入账号",
              prefixIcon: Padding(
                padding: EdgeInsets.all(5),
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
                hintText: "请输入密码",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: Config.defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              style:  ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 20.0),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Text(
                "登录".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: Config.defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignUpPage();
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
