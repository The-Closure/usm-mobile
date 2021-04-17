part of 'post_bloc.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}

class PostsFetched extends PostState {
  final List<PostModel> posts;
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
