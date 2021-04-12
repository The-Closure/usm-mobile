part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class FetchCommunityEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}
