part of 'like_bloc.dart';

@immutable
abstract class LikeState {}

class LikeInitial extends LikeState {}

class LikeAddedState extends LikeState {}

class LikeAddFaild extends LikeState {}

class LikeDeletedState extends LikeState {}

class LikeDeleteFaild extends LikeState {}
