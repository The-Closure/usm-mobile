import 'package:flutter/material.dart';
import 'package:usm_mobile/auth/view/pages/register.dart';

import 'home/view/home_view.dart';

void main() {
  runApp(MaterialApp(
    routes: {'/home': (_) => HomeView(), '/register': (_) => Register()},
    home: HomeView(),
    theme: ThemeData(primaryColor: Color.fromARGB(255, 67, 66, 93)),
  ));
}
