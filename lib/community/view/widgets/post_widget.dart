import 'package:flutter/material.dart';
import 'package:usm_mobile/community/models/post_response.dart';
import 'package:usm_mobile/community/view/widgets/comment_button.dart';
import 'package:usm_mobile/community/view/widgets/like_button.dart';
import 'package:usm_mobile/community/view/widgets/user.dart';

class Post extends StatelessWidget {
  final PostResponse post;
  Post({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
              blurRadius: 1,
              // color: Color.fromARGB(255, 67, 66, 93),
              spreadRadius: 0.5,
              offset: Offset.zero),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: User(
                  img: post.uentity.img,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${post.uentity.name}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '4h age',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                  style: TextStyle(color: Colors.black), text: '${post.value}'),
            ),
          ),
          // Divider(
          //   color: Colors.black,
          // ),
          if (post.attach != null)
            if (!post.attach.startsWith('path'))
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Image.network(
                  '${post.attach}',
                  fit: BoxFit.cover,
                ),
              ),
          Divider(
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LikeButton(post: post),
                CommentButton(post: post),
                IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                    color: Color.fromARGB(255, 67, 66, 93),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
