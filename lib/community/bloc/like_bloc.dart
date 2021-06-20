import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:usm_mobile/community/models/like_request.dart';
import 'package:usm_mobile/community/services/LikeService.dart';

part 'like_event.dart';
part 'like_state.dart';

class LikeBloc extends Bloc<LikeEvent, LikeState> {
  LikeBloc() : super(LikeInitial());
  LikeServiceImpl _likeService = LikeServiceImpl();

  @override
  Stream<LikeState> mapEventToState(
    LikeEvent event,
  ) async* {
    if (event is AddLike) {
      try {
        _likeService.addLike(
            postID: event.request.postID, userID: event.request.userID);
        yield LikeAddedState();
      } catch (e) {
        yield LikeAddFaild();
      }
    } else if (event is DeleteLike) {
      try {
        _likeService.deleteLike(
            postID: event.request.postID, userID: event.request.userID);
        yield LikeDeletedState();
      } catch (e) {
        yield LikeDeleteFaild();
      }
    }
  }
}
