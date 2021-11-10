import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usm_mobile/community/bloc/comment_bloc.dart';
import 'package:usm_mobile/community/models/post_response.dart';
import 'package:usm_mobile/community/view/widgets/comments_viewer.dart';
import 'package:usm_mobile/community/view/widgets/user.dart';

class CommentButton extends StatelessWidget {
  CommentButton({
    Key key,
    @required this.post,
  }) : super(key: key);

  final PostResponse post;

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
            return CommentViewer(
              post: post,
            );
          },
        ),
      ),
    );
  }
}
