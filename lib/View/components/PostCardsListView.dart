import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usm/Controllers/PostController.dart';
import 'package:usm/Models/PostModel.dart';
import 'package:usm/View/components/PostCard.dart';
import 'package:usm/View/components/PostCardDivider.dart';

class PostCardsListView extends StatefulWidget {
  PostCardsListView({Key key}) : super(key: key);

  @override
  _PostCardsListViewState createState() => _PostCardsListViewState();
}

class _PostCardsListViewState extends State<PostCardsListView> {
  PostController postController;
  @override
  void initState() {
    super.initState();
    Get.put(PostController());
    postController = Get.find<PostController>();
    postController.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return postController.postsList != []
        ? Stack(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10, top: 2, bottom: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 1,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                height: Get.height * 0.3,
                child: GetBuilder<PostController>(
                  init: PostController(),
                  builder: (_) => ListView.separated(
                    itemCount: postController.postsList.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          PostCard(
                            post: postController.postsList[index],
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return PostCardDivider();
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              Positioned(
                top: Get.height * 0.125,
                left: 10,
                child: CircleAvatar(
                  radius: 11,
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 10,
                      child: new IconButton(
                        padding: new EdgeInsets.all(0.0),
                        color: Colors.black,
                        icon: new Icon(Icons.keyboard_arrow_left, size: 18.0),
                        onPressed: () => {},
                      )),
                ),
              ),
              Positioned(
                top: Get.height * 0.125,
                right: 10,
                child: CircleAvatar(
                  radius: 11,
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 10,
                      child: new IconButton(
                        padding: new EdgeInsets.all(0.0),
                        color: Colors.black,
                        icon: new Icon(Icons.keyboard_arrow_right, size: 18.0),
                        onPressed: () => {},
                      )),
                ),
              ),
            ],
          )
        : Center(child: CircularProgressIndicator());
  }
}
