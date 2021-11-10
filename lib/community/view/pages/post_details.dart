import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usm_mobile/community/models/post_response.dart';
import 'package:usm_mobile/community/view/widgets/post_details_widget.dart';

class PostDetails extends StatelessWidget {
  PostDetails({
    Key key,
  }) : super(key: key);
  final PostResponse post = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Post',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: ListView(
        children: [
          PostDetailsWidget(
            post: post,
          ),
          // CommentViewer(post: post)
        ],
      ),
    );
  }
}
