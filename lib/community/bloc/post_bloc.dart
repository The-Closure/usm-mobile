import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:usm_mobile/community/models/post.dart';
import 'package:usm_mobile/community/services/PostService.dart';

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
        List<PostModel> posts = await postServiceImpl.fetchPosts(12);
        yield PostsFetched(posts: posts);
      } catch (e) {
        yield PostsError(message: e.toString());
      }
    }
  }
}
