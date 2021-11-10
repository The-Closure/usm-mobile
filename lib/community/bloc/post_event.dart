part of 'post_bloc.dart';

@immutable
abstract class PostEvent {
  List<Object> get props => [];
}

class LocalInit extends PostEvent {
  @override
  List<Object> get props => [];
}

class InitPosts extends PostEvent {
  int pageNo;
  InitPosts({this.pageNo});
  @override
  List<Object> get props => [];
}

class AddPostEvent extends PostEvent {
  int userID;
  String value;
  AddPostEvent({this.userID, this.value});
}

class PagePosts extends PostEvent {
  int pageNo;
  PagePosts({this.pageNo});
}

class ResetPostsState extends PostEvent {}
