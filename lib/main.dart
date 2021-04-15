import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usm_mobile/auth/view/pages/login.dart';
import 'package:usm_mobile/auth/view/pages/register.dart';
import 'package:usm_mobile/community/view/pages/Community.dart';

import 'home/view/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(
            name: '/home',
            page: () => HomeView(),
            transition: Transition.rightToLeft),
        GetPage(
            name: '/register',
            page: () => Register(),
            transition: Transition.leftToRight),
        GetPage(
            name: '/login', page: () => Login(), transition: Transition.fade),
        GetPage(
            name: '/community',
            page: () => Community(),
            transition: Transition.downToUp),
      ],
      debugShowCheckedModeBanner: false,
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
    );
  }
}
