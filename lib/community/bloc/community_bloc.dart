import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usm_mobile/community/services/CommunityService.dart';
import 'package:usm_mobile/community/models/Community.dart';
import 'package:usm_mobile/community/models/post.dart';

part 'community_event.dart';
part 'community_state.dart';

class CommunityBloc extends Bloc<CommunityEvent, CommunityState> {
  CommunityServiceImpl communityServiceImpl;

  CommunityBloc({this.communityServiceImpl}) : super(CommunityInitial());

  @override
  Stream<CommunityState> mapEventToState(
    CommunityEvent event,
  ) async* {
    if (event is InitCommunity) {
      yield CommunityInitial();
      try {
        Community community = await communityServiceImpl.getCommunity(
            (await SharedPreferences.getInstance()).getInt("communityID"));
        yield CommunityFetched(community: community);
      } catch (e) {
        yield CommunityError(error: e.toString());
      }
    }
  }
}
