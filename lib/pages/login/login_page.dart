import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:kreader/http/dio_util.dart';
import 'package:kreader/pages/login/components/login_page_top_image.dart';
import 'package:kreader/pages/responsive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/background.dart';
import 'components/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: const MobileLoginPage(),
          desktop: Row(
            children: [
              const Expanded(
                child: LoginPageTopImage(),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 450,
                      child: LoginForm(
                        press: (String name, String password) {
                          login(context, name, password);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void login(BuildContext context, String name, String password) {
  //显示加载框
  EasyLoading.show(status: '正在登录');
  debugPrint('接收点击事件 name ' + name + " password " + password);
  DioUtil util = DioUtil.getInstance();
  var future = util.login(name, password);
  future.then(
    (flag) {
      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }
      if (flag) {
        EasyLoading.showSuccess('登录成功');
        context.go('/home');
      } else {
        EasyLoading.showError('登录失败');
      }
    },
    onError: (e) {
      //取消加载框，显示网络错误
      debugPrint('网络错误');
      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }
      EasyLoading.showError('网络错误');
    },
  ).catchError((e) {
    //取消加载框，显示网络错误
    debugPrint('网络错误');
    if (EasyLoading.isShow) {
      EasyLoading.dismiss();
    }
    EasyLoading.showError('网络错误');
  });
}

class MobileLoginPage extends StatelessWidget {
  const MobileLoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const LoginPageTopImage(),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: LoginForm(
                press: (String name, String password) {
                  login(context, name, password);
                },
              ),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}
