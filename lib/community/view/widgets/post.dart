import 'package:flutter/material.dart';
import 'package:usm_mobile/community/models/post.dart';
import 'package:usm_mobile/community/view/widgets/user.dart';

class Post extends StatelessWidget {
  final PostModel post;
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
          Divider(
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Image.asset(
              'assets/images/welcome.jpg',
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
                IconButton(
                  icon: Icon(
                    Icons.thumb_up,
                    color: Color.fromARGB(255, 67, 66, 93),
                  ),
                  onPressed: () {
                    print(post.postID);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.message,
                    color: Color.fromARGB(255, 67, 66, 93),
                  ),
                  onPressed: () {
                    print(post.postID);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                    color: Color.fromARGB(255, 67, 66, 93),
                  ),
                  onPressed: () {
                    print(post.postID);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
