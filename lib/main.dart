import 'package:flutter/material.dart';
import 'package:usm_mobile/auth/view/pages/login.dart';
import 'package:usm_mobile/auth/view/pages/register.dart';

import 'home/view/home_view.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/home': (_) => HomeView(),
      '/register': (_) => Register(),
      '/login': (_) => Login()
    },
    home: HomeView(),
    theme: ThemeData(
        primaryColor: Color.fromARGB(255, 67, 66, 93),
        appBarTheme: AppBarTheme(
          centerTitle: true,
        )),
  ));
}
