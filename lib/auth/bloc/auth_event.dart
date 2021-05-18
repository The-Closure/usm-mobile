part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {
  List<Object> get props => [];
}

class FetchCommunityEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}

class RegisterEvent extends AuthEvent {
  final RegisterFormModel registerFormModel;
  RegisterEvent({@required this.registerFormModel});
  @override
  List<Object> get props => [];
}

class SignInEvent extends AuthEvent {
  final SignInModel signInModel;
  SignInEvent({@required this.signInModel});
  @override
  List<Object> get props => [];
}
