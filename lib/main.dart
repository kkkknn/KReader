import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kreader/app.dart';
import 'package:kreader/pages/book_info/book_info_page.dart';
import 'package:kreader/pages/constants.dart';
import 'package:kreader/pages/login/login_page.dart';
import 'package:kreader/pages/search/search_page.dart';
import 'package:kreader/pages/signup/signup_page.dart';
import 'package:kreader/pages/welcome/welcome_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'pages/browse/browsePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'flutter demo',
      theme: ThemeData(
        primarySwatch: Config.primarySwatchColor,
        scaffoldBackgroundColor: Config.primaryLightColor,
      ),
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) =>
              const WelcomePage()),
      GoRoute(
          path: '/home',
          builder: (BuildContext context, GoRouterState state) => const App()),
      GoRoute(
          path: '/login',
          builder: (BuildContext context, GoRouterState state) =>
              const LoginPage()),
      GoRoute(
          path: '/signup',
          builder: (BuildContext context, GoRouterState state) =>
              const SignUpPage()),
      GoRoute(
        path: '/search/:searchWord',
        builder: (BuildContext context, GoRouterState state) {
          return SearchPage(
            searchWord: state.params['searchWord']!,
          );
        },
      ),
      GoRoute(
        path: '/bookInfo/:id',
        builder: (BuildContext context, GoRouterState state) {
          return BookInfoPage(
            id: state.params['id']!,
          );
        },
      ),
      GoRoute(
        name: 'browseView',
        path: '/browseView/:bookId',
        builder: (BuildContext context, GoRouterState state) {
          return BrowsePage(
            bookId: state.params['bookId']!,
            page: state.queryParams['page']!,
            episodeCount: state.queryParams['episodeCount']!,
          );
        },
      ),
    ],

  );
}
