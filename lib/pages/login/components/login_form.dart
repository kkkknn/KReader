import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kreader/pages/constants.dart';
import 'package:kreader/pages/signup/signup_page.dart';

import '../../../components/already_have_an_account_acheck.dart';

class LoginForm extends StatelessWidget {
  Function press;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginForm({
    Key? key,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Form(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              textInputAction: TextInputAction.done,
              cursorColor: Config.primaryColor,
              decoration: const InputDecoration(
                hintText: "请输入账号",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(Icons.person),
                ),
              ),
            ),
            TextFormField(
              controller: _passwordController,
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
            const SizedBox(height: Config.defaultPadding),
            Hero(
              tag: "login_btn",
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 150, vertical: 20.0),
                ),
                onPressed: () {
                  var name = _nameController.text;
                  var password = _passwordController.text;
                  if (name.isEmpty) {
                    //显示框验证失败
                    EasyLoading.showError('用户名不能为空');
                  } else if (password.isEmpty) {
                    EasyLoading.showError('密码不能为空');
                  } else {
                    press(_nameController.text, _passwordController.text);
                  }
                },
                child: Text(
                  "登录".toUpperCase(),
                ),
              ),
            ),
            const SizedBox(height: Config.defaultPadding),
            AlreadyHaveAnAccountCheck(
              press: () {
                EasyLoading.showToast('注册 暂不开放');
                /*Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignUpPage();
                  },
                ),
              );*/
              },
            ),
          ],
        ),
      ),
    );
  }
}
