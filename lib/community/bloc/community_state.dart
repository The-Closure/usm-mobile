part of 'community_bloc.dart';

@immutable
abstract class CommunityState {
  String get error => 'abstract';
  List<Object> get props => [];
}

// ignore: must_be_immutable
class CommunityInitial extends CommunityState {
  @override
  List<Object> get props => [];
}

class CommunityFetched extends CommunityState {
  final Community community;
  CommunityFetched({this.community});
  @override
  List<Object> get props => [];
}

class InitiatedBefore extends CommunityState {
  @override
  List<Object> get props => [];
}

class CommunityError extends CommunityState {
  final String error;
  CommunityError({this.error});
  @override
  List<Object> get props => [];
}

class PostsInitial extends CommunityState {
  @override
  List<Object> get props => [];
}

class PostsFetched extends CommunityState {
  final Posts posts;
  PostsFetched({this.posts});
  @override
  List<Object> get props => [];
  @override
  String get error => '';
}

class PostsError extends CommunityState {
  final String message;
  PostsError({this.message});
  @override
  String get error => message;
  @override
  List<Object> get props => [];
}
