import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usm_mobile/community/bloc/comment_bloc.dart';
import 'package:usm_mobile/community/models/post_response.dart';
import 'package:usm_mobile/community/view/widgets/user.dart';

class CommentButton extends StatelessWidget {
  CommentButton({
    Key key,
    @required this.post,
  }) : super(key: key);

  final PostResponse post;
  TextEditingController commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _viewComments(context),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.message,
              color: Color.fromARGB(255, 67, 66, 93),
            ),
            onPressed: () {},
          ),
          BlocConsumer<CommentBloc, CommentState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Text(
                '${post.comments.length} comments',
                style: TextStyle(fontSize: 12),
              );
            },
          )
        ],
      ),
    );
  }

  void _viewComments(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctxt) => Scaffold(
        appBar: AppBar(
            title: Text(
              'comments',
              style: TextStyle(letterSpacing: 2, color: Colors.white),
            ),
            centerTitle: true),
        body: BlocConsumer<CommentBloc, CommentState>(
          listener: (context, state) {
            if (state is CommentAddedState) {
              post.comments.add(state.comment);
              Get.snackbar('message', 'successful ...');
            } else if (state is CommentProcessFaildState) {
              Get.snackbar('message', 'error : ${state.error}');
            }
          },
          builder: (context, state) {
            if (post.comments.length == 0) {
              return Center(
                child: Column(
                  children: [
                    Spacer(),
                    Expanded(
                      child: Text('no comments yet ...'),
                      flex: 6,
                    ),
                    Spacer(),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Container(
                              padding: EdgeInsets.all(8),
                              alignment: Alignment.center,
                              child: TextField(
                                controller: commentController,
                                decoration: InputDecoration(
                                  hintText: 'add comment ...',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              onPressed: () async {
                                BlocProvider.of<CommentBloc>(context).add(
                                  AddCommentEvent(
                                    value: commentController.text,
                                    postID: post.postID,
                                    userID:
                                        await SharedPreferences.getInstance()
                                            .then(
                                      (value) => value.getInt('userID'),
                                    ),
                                  ),
                                );
                                commentController.clear();
                              },
                              icon: Icon(
                                Icons.send,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      flex: 1,
                    )
                  ],
                ),
              );
            } else
              return Column(
                children: [
                  Expanded(
                      flex: 6,
                      child: ListView.builder(
                        itemCount: post.comments.length,
                        itemBuilder: (context, index) => ListTile(
                          leading: User(
                            img: post.comments[index].uentity.img,
                          ),
                          title: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(post.comments[index].uentity.name),
                              Text(post.comments[index].value),
                            ],
                          ),
                        ),
                      )),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            alignment: Alignment.center,
                            child: TextField(
                              controller: commentController,
                              decoration: InputDecoration(
                                hintText: 'add comment ...',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: () async {
                              BlocProvider.of<CommentBloc>(context).add(
                                AddCommentEvent(
                                  value: commentController.text,
                                  postID: post.postID,
                                  userID: await SharedPreferences.getInstance()
                                      .then(
                                    (value) => value.getInt('userID'),
                                  ),
                                ),
                              );
                              commentController.clear();
                            },
                            icon: Icon(
                              Icons.send,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    flex: 1,
                  )
                ],
              );
          },
        ),
      ),
    );
  }
}
