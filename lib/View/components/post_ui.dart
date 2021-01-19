import 'package:flutter/material.dart';
import 'package:usm_mobile/Models/PostModel.dart';
import 'package:usm_mobile/View/components/CommunityPostList.dart';
import 'package:usm_mobile/View/components/CustomAppBar.dart';

class Post_ui extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: CommunityPostsBuilder(),
    );
  }
}
