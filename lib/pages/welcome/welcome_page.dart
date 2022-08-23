import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kreader/components/background.dart';
import 'package:kreader/http/dio_util.dart';
import 'package:kreader/pages/responsive.dart';
import 'package:kreader/pages/welcome/components/login_signup_btn.dart';
import 'package:kreader/pages/welcome/components/welcome_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatelessWidget{
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    //判断是否token,有的话直接进到主页
    var result = _autoLogin();
    result.then((value){
      context.go('/home');
    },onError: (e){

    });
    return Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Responsive(
            desktop: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Expanded(
                  child: WelcomeImage(),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 450,
                        child: LoginAndSignupBtn(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            mobile: const MobileWelcomePage(),
          ),
        ),
      ),
    );
  }

  Future<bool> _autoLogin() async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    if(token==null||token.isEmpty){
      return false;
    }else {
      DioUtil util =DioUtil.getInstance();
      util.setToken(token);
      return true;
    }
  }
}


class MobileWelcomePage extends StatelessWidget {
  const MobileWelcomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const WelcomeImage(),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: LoginAndSignupBtn(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
