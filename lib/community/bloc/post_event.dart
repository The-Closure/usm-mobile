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
  @override
  List<Object> get props => [];
}
