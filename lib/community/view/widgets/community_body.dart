import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:usm_mobile/community/bloc/community_bloc.dart';
import 'package:usm_mobile/community/bloc/post_bloc.dart';
import 'package:usm_mobile/community/models/post_response.dart';
import 'package:usm_mobile/community/view/widgets/AddPost.dart';
import 'package:usm_mobile/community/view/widgets/loading_posts.dart';
import 'package:usm_mobile/community/view/widgets/post_widget.dart';

// ignore: must_be_immutable
class CommunityBody extends StatefulWidget {
  CommunityBody({Key key, @required this.scrollController}) : super(key: key);
  ScrollController scrollController;
  @override
  _CommunityBodyState createState() => _CommunityBodyState();
}

class _CommunityBodyState extends State<CommunityBody> {
  List<PostResponse> posts = List.empty(growable: true);

  int pageNo = 0;
  bool scrollInit = true;
  double index = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostBloc, PostState>(
      listener: (context, state) {
        // Get.snackbar('messge', 'listener works');
        if (state is NullPostsPageState) {
        } else if (state is PostPageFetchedState) {
          setState(() {
            posts.addAll(state.postsResponse);
          });
        } else if (state is PostsFetched) {
          posts.clear();
          posts.addAll(state.posts);
        } else if (state is PostAddedState)
          setState(() {
            posts.insert(0, state.postResponse);
          });
      },
      buildWhen: (pstate, cstate) => !(cstate is NullPostsPageState ||
          cstate is PostPageFetchedState ||
          cstate is PostAddedState ||
          cstate is AddingPostState),
      builder: (context, state) {
        if (state is InitPosts) {
          return LoadingPosts();
        } else if (state is PostsFetched) {
          return NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollEndNotification &&
                  scrollNotification.metrics.pixels ==
                      scrollNotification.metrics.maxScrollExtent) {
                print('${scrollNotification.metrics.pixels}');
                BlocProvider.of<PostBloc>(context)
                    .add(PagePosts(pageNo: pageNo += 1));
              }
              return false;
            },
            child: SmartRefresher(
              controller: RefreshController(),
              onRefresh: () {
                BlocProvider.of<PostBloc>(context).add(InitPosts(pageNo: 0));
                BlocProvider.of<CommunityBloc>(context).add(InitCommunity());
              },
              child: ListView.builder(
                controller: widget.scrollController,
                padding: EdgeInsets.all(0),
                itemCount: posts.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0)
                    return Column(
                      children: [
                        AddPost(),
                        Post(
                          post: posts[index],
                        ),
                      ],
                    );
                  else
                    return Post(post: posts[index]);
                },
              ),
            ),
          );
        } else if (state is PostsError) {
          return Container(
            alignment: Alignment.center,
            child: IconButton(
              icon: Icon(
                Icons.replay_outlined,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                BlocProvider.of<PostBloc>(context).add(InitPosts(pageNo: 0));
                BlocProvider.of<CommunityBloc>(context).add(InitCommunity());
              },
            ),
          );
        } else {
          return LoadingPosts();
        }
      },
    );
  }
}
