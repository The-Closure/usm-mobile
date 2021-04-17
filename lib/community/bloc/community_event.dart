part of 'community_bloc.dart';

@immutable
abstract class CommunityEvent {
  List<Object> get props => [];
}

class InitCommunity extends CommunityEvent {
  @override
  List<Object> get props => [];
}

class LocalInit extends CommunityEvent {
  @override
  List<Object> get props => [];
}

class AddOrRemoveLike extends CommunityEvent {
  final int postID;
  final int userID;
  AddOrRemoveLike({this.postID, this.userID});
  @override
  List<Object> get props => [];
}

class AddComment extends CommunityEvent {
  final String value;
  final int userID;
  AddComment({this.userID, this.value});
  @override
  List<Object> get props => [];
}

class RemoveComment extends CommunityEvent {
  final int userID;
  final int commentID;
  RemoveComment({this.commentID, this.userID});
  @override
  List<Object> get props => [];
}
