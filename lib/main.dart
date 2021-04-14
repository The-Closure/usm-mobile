import 'package:flutter/material.dart';
import 'package:usm_mobile/auth/view/pages/login.dart';
import 'package:usm_mobile/auth/view/pages/register.dart';
import 'package:usm_mobile/community/Community.dart';

import 'home/view/home_view.dart';

class keys {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();
}

void main() {
  runApp(MaterialApp(
    navigatorKey: keys.navigatorKey,
    routes: {
      '/home': (_) => HomeView(),
      '/register': (_) => Register(),
      '/login': (_) => Login(),
      '/community': (_) => Community()
    },
    home: HomeView(),
    theme: ThemeData(
        primaryColor: Color.fromARGB(255, 67, 66, 93),
        appBarTheme: AppBarTheme(
          centerTitle: true,
        )),
  ));
}
