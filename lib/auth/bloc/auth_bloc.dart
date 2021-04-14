import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:usm_mobile/auth/models/CommunityModel.dart';
import 'package:usm_mobile/auth/models/RegisterFormModel.dart';
import 'package:usm_mobile/auth/models/RegisterdUser.dart';
import 'package:usm_mobile/auth/services/AuthService.dart';
import 'package:usm_mobile/auth/services/CommunityService.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  GlobalKey<NavigatorState> navigatorKey;
  CommunityService communityService;
  AuthService authService;
  AuthBloc({this.communityService, this.authService, this.navigatorKey})
      : super(AuthInitial());

  AuthState get InitialState => AuthInitial();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is FetchCommunityEvent) {
      yield CommunityLoadingState();
      try {
        List<CommunityModel> communities =
            await communityService.getCommunities();
        yield CommunityLoadedState(communities: communities);
      } catch (e) {
        yield CommunityErrorState(message: e.toString());
      }
    } else if (event is RegisterEvent) {
      yield ProcessingRegisterState();
      try {
        RegisteredUser registeredUser =
            await authService.registerUser(event.registerFormModel);
        navigatorKey.currentState.pushNamed('/community',
            arguments: {'userDetails': registeredUser});
        yield SuccessfulRegisterState(registeredUser: registeredUser);
      } catch (e) {
        print('event error ${e.toString()}');
        yield FaildRegisterState(message: e.toString());
      }
    }
  }
}
