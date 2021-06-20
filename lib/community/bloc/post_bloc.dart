import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usm_mobile/community/models/post_response.dart';
import 'package:usm_mobile/community/services/Post_service.dart';
import 'package:usm_mobile/community/view/widgets/AddPost.dart';
import 'package:usm_mobile/community/view/widgets/post_widget.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostServiceImpl postServiceImpl;
  PostBloc({this.postServiceImpl}) : super(PostInitial());

  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
    if (event is InitPosts) {
      yield PostInitial();
      try {
        List<PostResponse> posts = await postServiceImpl.fetchPosts(
            (await SharedPreferences.getInstance()).getInt("communityID"),
            pageNo: event?.pageNo);
        yield PostsFetched(posts: posts);
      } catch (e) {
        yield PostsError(message: e.toString());
      }
    } else if (event is AddPostEvent) {
      yield AddingPostState();
      try {
        yield PostAddedState(
          postResponse:
              await postServiceImpl.addPost(event.userID, event.value),
        );
        // List<PostResponse> posts = await postServiceImpl.fetchPosts(
        //     (await SharedPreferences.getInstance()).getInt("communityID"));
        // yield PostsFetched(posts: posts);
      } catch (e) {
        yield FaildAddPostState(
          error: e.toString(),
        );
      }
    } else if (event is PagePosts) {
      List<PostResponse> posts = await postServiceImpl.fetchPosts(
          (await SharedPreferences.getInstance()).getInt("communityID"),
          pageNo: event.pageNo);
      if (posts.length == 0) yield NullPostsPageState();
      yield PostPageFetchedState(postsResponse: posts);
    }
  }
}
