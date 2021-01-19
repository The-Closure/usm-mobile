import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'View/pages/community_page.dart';

void main() {
  runApp(MyApp());
}

//test commint
//second
//third comment
//end commit
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Community_Page(),
    );
  }
}
