part of 'auth_bloc.dart';

@immutable
abstract class AuthState {
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class CommunityLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class CommunityLoadedState extends AuthState {
  final List<CommunityModel> communities;
  CommunityLoadedState({this.communities});

  @override
  List<Object> get props => [];
}

class CommunityErrorState extends AuthState {
  final message;
  CommunityErrorState({this.message});

  @override
  List<Object> get props => [];
}

class ProcessingRegisterState extends AuthState {
  @override
  List<Object> get props => [];
}

class SuccessfulRegisterState extends AuthState {
  final int communityId;
  final RegisteredUser registeredUser;
  SuccessfulRegisterState({this.registeredUser, this.communityId});
  @override
  List<Object> get props => [];
}

class FaildRegisterState extends AuthState {
  final message;
  FaildRegisterState({this.message});
  @override
  List<Object> get props => [];
}
