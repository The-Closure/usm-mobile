import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:usm_mobile/auth/models/CommunityModel.dart';
import 'package:usm_mobile/auth/services/CommunityService.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  CommunityService communityService;
  AuthBloc({@required this.communityService}) : super(AuthInitial());

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
    }
  }
}
