import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:usm_mobile/community/models/comment.dart';
import 'package:usm_mobile/community/services/comment_service.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc() : super(CommentInitial());
  CommentService commentService = CommentService();
  @override
  Stream<CommentState> mapEventToState(
    CommentEvent event,
  ) async* {
    if (event is AddCommentEvent) {
      try {
        yield AddingCommentState();
        Comments comment = await commentService.addComment(
            event.value, event.userID, event.postID);
        yield CommentAddedState(comment: comment);
      } catch (e) {
        yield CommentProcessFaildState(error: e.toString());
      }
    }
  }
}
