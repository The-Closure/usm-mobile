part of 'comment_bloc.dart';

@immutable
abstract class CommentEvent {}

class AddCommentEvent extends CommentEvent {
  int postID;
  int userID;
  String value;
  AddCommentEvent({this.postID, this.userID, this.value});
}