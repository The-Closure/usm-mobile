part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfilePostsLoadingState extends ProfileState {}

class ProfilePostsLoadedState extends ProfileState {}

class ProfilePostsErrorState extends ProfileState {}
