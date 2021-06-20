part of 'like_bloc.dart';

@immutable
abstract class LikeEvent {}

class AddLike extends LikeEvent {
  LikeRequest request;
  AddLike({this.request});
}

class DeleteLike extends LikeEvent {
  LikeRequest request;
  DeleteLike({this.request});
}
