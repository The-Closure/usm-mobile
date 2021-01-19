import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usm/View/components/tiles.dart';
import '../components/SearchUI.dart';

import '../components/side_bar.dart';
import '../components/custom_appbar.dart';

class Search_Page extends StatefulWidget {
  Search_Page({Key key}) : super(key: key);

  @override
  Search_Page_State createState() => Search_Page_State();
}

class Search_Page_State extends State<Search_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Row(
        children: [
          SingleChildScrollView(child: Side_bar(selected: 4)),
          Container(
            width: Get.width * 0.8,
            child: SearchUI(),
          ),
        ],
      ),
    );
  }
}
