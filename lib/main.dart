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
      initialRoute: '/community',
      theme: ThemeData(
          primarySwatch: createMaterialColor(Color.fromARGB(255, 67, 66, 93)),
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

  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }
}
