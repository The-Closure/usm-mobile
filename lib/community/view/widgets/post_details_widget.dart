import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usm_mobile/community/bloc/comment_bloc.dart';
import 'package:usm_mobile/community/bloc/post_bloc.dart';
import 'package:usm_mobile/community/models/comment.dart';
import 'package:usm_mobile/community/models/post_response.dart';
import 'package:usm_mobile/community/view/widgets/comment_button.dart';
import 'package:usm_mobile/community/view/widgets/comment_widget.dart';
import 'package:usm_mobile/community/view/widgets/like_button.dart';
import 'package:usm_mobile/community/view/widgets/user.dart';
import 'package:usm_mobile/consts.dart';

class PostDetailsWidget extends StatelessWidget {
  PostResponse post;
  PostDetailsWidget({Key key, @required this.post}) : super(key: key);
  TextEditingController commentController = TextEditingController();
  RepoValues repoValues = RepoValues();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: RepoValues().init(),
        builder: (context, value) {
          BlocProvider.of<CommentBloc>(context).add(ResetCommentsState());
          if (value.hasData)
            return Container(
              // padding: EdgeInsets.all(8),
              // margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      blurRadius: 1,
                      // color: Color.fromARGB(255, 67, 66, 93),
                      spreadRadius: 0.5,
                      offset: Offset.zero),
                ],
              ),
              child: SingleChildScrollView(
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
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            )
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                            style: TextStyle(color: Colors.black),
                            text: '${post.value}'),
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 8.0),
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
                    ),
                    BlocBuilder<CommentBloc, CommentState>(
                      builder: (context, state) {
                        if (state is CommentAddedState) {
                          post.comments.add(state.comment);

                          return Column(
                            children: [
                              for (Comments comment in post.comments)
                                CommentWidget(
                                  comment: comment,
                                  userID: value.data,
                                ),
                            ],
                          );
                        } else if (state is CommentDeletedState) {
                          print('object');
                          print(state.commentID);
                          post.comments.removeWhere(
                              (element) => element.id == state.commentID);

                          return Column(
                            children: [
                              for (Comments comment in post.comments)
                                CommentWidget(
                                  comment: comment,
                                  userID: value.data,
                                ),
                            ],
                          );
                        } else
                          return Column(
                            children: [
                              for (Comments comment in post.comments)
                                CommentWidget(
                                    comment: comment, userID: value.data)
                            ],
                          );
                      },
                    ),
                    BlocBuilder<CommentBloc, CommentState>(
                      builder: (context, state) {
                        if (state is AddingCommentState ||
                            state is DeletingCommentState)
                          return Row(
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
                                  flex: 1, child: CircularProgressIndicator()),
                            ],
                          );
                        else
                          return Row(
                            children: [
                              Expanded(
                                flex: 7,
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  alignment: Alignment.center,
                                  child: TextField(
                                    controller: commentController,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: state
                                                    is CommentProcessFaildState
                                                ? Colors.red
                                                : Theme.of(context)
                                                    .primaryColor,
                                            width: 2.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 2.0),
                                      ),
                                      hintText: 'add comment ...',
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
                                        userID: await SharedPreferences
                                                .getInstance()
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
                          );
                      },
                    ),
                    // CommentViewer(post: post)
                  ],
                ),
              ),
            );
          else
            return Center(child: CircularProgressIndicator());
        });
  }
}
