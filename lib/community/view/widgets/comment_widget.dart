import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usm_mobile/community/bloc/comment_bloc.dart';
import 'package:usm_mobile/community/models/comment.dart';
import 'package:usm_mobile/community/view/widgets/user.dart';

@immutable
class CommentWidget extends StatelessWidget {
  CommentWidget({Key key, @required this.comment, @required this.userID})
      : super(key: key);
  final int userID;
  final Comments comment;
  @override
  Widget build(BuildContext context) {
    return
        //  BlocConsumer<CommentBloc, CommentState>(
        //   listener: (context, state) {
        //     if (state is CommentDeletedState)
        //       Get.snackbar('title', 'comment deleted');
        //     else if (state is CommentProcessFaildState)
        //       Get.snackbar('title', 'faild to delete comment');
        //   },
        //   builder: (context, state) {
        // return
        Container(
            child: comment.uentity.id == userID
                ? Dismissible(
                    confirmDismiss: (direction) {
                      return showDialog(
                        context: context,
                        builder: (context) =>
                            BlocListener<CommentBloc, CommentState>(
                          // listenWhen: (prev, current) =>
                          //     prev is DeletingCommentState,
                          listener: (context, state) {
                            if (state is CommentDeletedState) {
                              print('comment deleted');
                              // Navigator.of(context).pop(true);
                            } else if (state is CommentProcessFaildState)
                              print('faild to delete comment');
                            // Navigator.of(context).pop(false);
                          },
                          child: AlertDialog(
                            title: Text('delete comment'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                  BlocProvider.of<CommentBloc>(context).add(
                                      DeleteCommentEvent(
                                          commentID: comment.id,
                                          userID: userID));
                                },
                                child: Text('delete'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                                child: Text('cancel'),
                              ),
                            ],
                          ),
                        ),
                      ).then((value) => value);
                    },
                    background: Container(
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        'delete comment',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Segoe',
                            color: Colors.red),
                      ),
                      alignment: Alignment.center,
                    ),
                    key: GlobalKey(),
                    child: ListTile(
                      leading: User(
                        img: comment.uentity.img,
                      ),
                      title: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(comment.uentity.name),
                          Text(comment.value),
                        ],
                      ),
                    ),
                  )
                : ListTile(
                    leading: User(
                      img: comment.uentity.img,
                    ),
                    title: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(comment.uentity.name),
                        Text(comment.value),
                      ],
                    ),
                  ));
//       },
//     );
  }
}
