part of 'post_bloc.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}

class PostsFetched extends PostState {
  final List<PostResponse> posts;
  PostsFetched({this.posts});
  @override
  List<Object> get props => [];
  @override
  String get error => '';
}

class PostsError extends PostState {
  final String message;
  PostsError({this.message});
  @override
  String get error => message;
  @override
  List<Object> get props => [];
}

class AddingPostState extends PostState {}

class PostAddedState extends PostState {
  PostResponse postResponse;
  PostAddedState({this.postResponse});
}

class FaildAddPostState extends PostState {
  String error;
  FaildAddPostState({this.error});
}

class PostPageFetchedState extends PostState {
  List<PostResponse> postsResponse;
  PostPageFetchedState({this.postsResponse});
}

class NullPostsPageState extends PostState {}
