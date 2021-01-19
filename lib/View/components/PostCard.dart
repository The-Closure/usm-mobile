import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usm_mobile/Models/CommentModel.dart';
import 'package:usm_mobile/Models/PostModel.dart';
import 'package:usm_mobile/View/components/CommentsSheet.dart';

class PostCard extends StatelessWidget {
  final Post post;
  PostCard({Key key, this.post}) : super(key: key);

  openCommentsSheet() {
    List<Comment> comments = this.post.commentArr;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.70,
      height: Get.height * 0.3,
      child: Card(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      height: Get.height * 0.15,
                      width: Get.width * 0.70,
                      child: Image.asset(
                        'assets/images/Univ.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        top: 10,
                      ),
                      child: Row(
                        children: [
                          Text(
                            this.post.title != null
                                ? this.post.title
                                : 'Default Title',
                            style: TextStyle(
                              color: Color(0xAAB39DD8),
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              this.post.description != ''
                                  ? this.post.description
                                  : 'Default Description',
                              style: TextStyle(
                                color: Color(0xAA616161),
                                fontSize: 12,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        this.post.duration + 'ago',
                        style: TextStyle(fontSize: 10),
                      ),
                      Row(
                        children: [
                          this.post.likes != 0
                              ? Text(
                                  '${this.post.likes} likes',
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                )
                              : Text(''),
                          this.post.comments != 0
                              ? GestureDetector(
                                  child: Text(
                                    ' ${this.post.comments} comments',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  onTap: () => showModalBottomSheet(
                                      context: context,
                                      builder: (ctx) => CommentsSheet(
                                          ctx, this.post.commentArr)),
                                )
                              : Text(''),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              right: 0,
              top: Get.height * 0.125,
              child: CircleAvatar(
                radius: 22,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/2.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
