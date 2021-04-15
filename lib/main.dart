import 'package:flutter/material.dart';
import 'package:usm_mobile/auth/view/pages/login.dart';
import 'package:usm_mobile/auth/view/pages/register.dart';
import 'package:usm_mobile/community/view/pages/Community.dart';

import 'home/view/home_view.dart';

class Keys {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    navigatorKey: Keys.navigatorKey,
    routes: {
      '/home': (_) => HomeView(),
      '/register': (_) => Register(),
      '/login': (_) => Login(),
      '/community': (_) => Community()
    },
    initialRoute: '/home',
    theme: ThemeData(
        bottomAppBarColor: Color.fromARGB(255, 67, 66, 93),
        iconTheme: IconThemeData(color: Colors.white),
        primaryColor: Color.fromARGB(255, 67, 66, 93),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.white,
            foregroundColor: Color.fromARGB(255, 67, 66, 93)),
        appBarTheme: AppBarTheme(
          centerTitle: true,
        )),
  ));
}
