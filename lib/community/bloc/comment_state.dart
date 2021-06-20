part of 'comment_bloc.dart';

@immutable
abstract class CommentState {}

class CommentInitial extends CommentState {}

class AddingCommentState extends CommentState {}

class CommentAddedState extends CommentState {
  Comments comment;
  CommentAddedState({this.comment});
}

class DeletingCommentState extends CommentState {}

class CommentDeletedState extends CommentState {
  int commentID;
  CommentDeletedState({this.commentID});
}

class CommentProcessFaildState extends CommentState {
  String error;
  CommentProcessFaildState({this.error});
}
