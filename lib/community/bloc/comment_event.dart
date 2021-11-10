part of 'comment_bloc.dart';

@immutable
abstract class CommentEvent {}

class AddCommentEvent extends CommentEvent {
  final int postID;
  final int userID;
  final String value;
  AddCommentEvent({this.postID, this.userID, this.value});
}

class DeleteCommentEvent extends CommentEvent {
  final int userID;
  final int commentID;
  DeleteCommentEvent({this.commentID, this.userID});
}

class ResetCommentsState extends CommentEvent {}
