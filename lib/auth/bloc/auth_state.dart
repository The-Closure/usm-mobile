part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class CommunityLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class CommunityLoadedState extends AuthState {
  List<CommunityModel> communities;
  CommunityLoadedState({this.communities});

  @override
  List<Object> get props => [];
}

class CommunityErrorState extends AuthState {
  String message;
  CommunityErrorState({this.message});

  @override
  List<Object> get props => [];
}
