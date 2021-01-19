import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'PostCardsListView.dart';

class CommunityPostsBuilder extends StatelessWidget {
  const CommunityPostsBuilder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            PostCardsListView(),
            Container(
              padding: EdgeInsets.only(
                  top: 30,
                  bottom: 10,
                  left: Get.height * 0.1,
                  right: Get.height * 0.1),
              child: Divider(
                color: Color(0xAAB39DD8),
                thickness: 5,
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 30),
              child: Text(
                'COMMUNITY POSTS',
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xAA616161),
                ),
              ),
            ),
            PostCardsListView(),
          ],
        ),
      ),
    );
  }
}
