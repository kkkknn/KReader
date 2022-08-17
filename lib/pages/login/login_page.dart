import 'package:flutter/material.dart';
import 'package:kreader/http/dio_util.dart';
import 'package:kreader/pages/login/components/login_page_top_image.dart';
import 'package:kreader/pages/responsive.dart';

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
                  children:[
                    SizedBox(
                      width: 450,
                      child: LoginForm(
                        press: (String name,String password){
                          debugPrint('接收点击事件 name '+name+" password "+password);
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
                press: (String name,String password) async {
                  Navigator.pushNamed(context,"/home");
                  /*DioUtil util = DioUtil.getInstance();
                  bool flag=await util.login('18810836346', 'QQ2244355530');
                  if(flag){
                    debugPrint('登录成功');
                    Navigator.pushNamed(context,"/home");
                  }else{
                    debugPrint('登陆失败');
                  }
                  debugPrint('接收点击事件 name '+name+" password "+password);*/
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
