import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:usm_mobile/community/bloc/post_bloc.dart';
import 'package:usm_mobile/community/models/post.dart';
import 'package:usm_mobile/community/services/CommunityService.dart';
import 'package:usm_mobile/community/bloc/community_bloc.dart';
import 'package:usm_mobile/community/services/PostService.dart';
import 'package:usm_mobile/community/view/widgets/AddPost.dart';
import 'package:usm_mobile/community/view/widgets/loading_posts.dart';
import 'package:usm_mobile/community/view/widgets/loading_users.dart';
import 'package:usm_mobile/community/view/widgets/post.dart';
import 'package:usm_mobile/community/view/widgets/user.dart';

//ignore: must_be_immutable

class Community extends StatelessWidget {
  final scroller = ScrollController();

  final communityId = 12;

  Future<bool> _onWillPop(BuildContext context) async {
    if (scroller.offset > 0) {
      scroller.animateTo(0,
          duration: Duration(seconds: 1), curve: Curves.easeInOut);
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    // final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    // int communityId = arguments['communityId'] as int;
    // RegisteredUser user = Get.arguments['userDetails'] as RegisteredUser;
    // int communityId = Get.arguments['communityId'] ?? 12;
    // if (arguments != null) print(arguments['userDetails']);
    // user = arguments['userDetails'];
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: GestureDetector(
        onTap: () => _onWillPop(context),
        child: Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            child: Row(
              children: [
                IconButton(icon: Icon(Icons.person), onPressed: () {}),
                IconButton(icon: Icon(Icons.home), onPressed: () {}),
                Spacer(),
                IconButton(
                    icon: Icon(Icons.account_balance_outlined),
                    onPressed: () {}),
                IconButton(icon: Icon(Icons.settings), onPressed: () {}),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
              child: Container(
                child: Icon(
                  Icons.search,
                ),
              ),
              onPressed: () {}),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: NestedScrollView(
            controller: scroller,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                BlocProvider(
                  create: (context) {
                    CommunityBloc communityBloc = CommunityBloc(
                        communityServiceImpl: CommunityServiceImpl(),
                        communityId: communityId);
                    communityBloc.add(InitCommunity());
                    return communityBloc;
                  },
                  child: SliverAppBar(
                    expandedHeight: 125.0,
                    floating: false,
                    pinned: true,
                    snap: false,
                    flexibleSpace: BlocBuilder<CommunityBloc, CommunityState>(
                      builder: (context, state) {
                        if (state is CommunityInitial) {
                          return FlexibleSpaceBar(
                            titlePadding: EdgeInsets.all(16),
                            title: Shimmer(
                              child: Text('loading'),
                              gradient: LinearGradient(colors: [
                                Colors.white,
                                Color.fromARGB(255, 67, 66, 93)
                              ]),
                            ),
                            background: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                LoadingUsers(),
                                LoadingUsers(),
                                LoadingUsers(),
                                LoadingUsers(),
                              ],
                            ),
                            centerTitle: true,
                          );
                        } else if (state is CommunityFetched) {
                          return FlexibleSpaceBar(
                            collapseMode: CollapseMode.parallax,
                            titlePadding: EdgeInsets.all(16),
                            title: Text(
                              '${state.community.name}',
                              style: TextStyle(fontSize: 12),
                            ),
                            background: ListView.builder(
                              // controller: scroller,
                              itemCount: state.community.users.length,
                              itemBuilder: (_, index) {
                                return GestureDetector(
                                  onTap: () => print(state
                                      .community.users[index]
                                      .toJson()
                                      .toString()),
                                  child: User(
                                    img: state.community.users[index].img,
                                  ),
                                );
                              },
                              scrollDirection: Axis.horizontal,
                            ),
                            centerTitle: true,
                          );
                        } else {
                          return FlexibleSpaceBar(
                            titlePadding: EdgeInsets.all(16),
                            title: Text('${state.error}'),
                            background: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                User(),
                                User(),
                              ],
                            ),
                            centerTitle: true,
                          );
                        }
                      },
                    ),
                  ),
                ),
              ];
            },
            body: Column(
              children: [
                AddPost(),
                BlocProvider(
                  create: (context) {
                    PostBloc postBloc =
                        PostBloc(postServiceImpl: PostServiceImpl());
                    postBloc.add(InitPosts());
                    return postBloc;
                  },
                  child: BlocBuilder<PostBloc, PostState>(
                    builder: (context, state) {
                      if (state is InitPosts) {
                        return LoadingPosts();
                      } else if (state is PostsFetched) {
                        return Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.all(0),
                            itemCount: state.posts.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Post(post: state.posts[index]);
                            },
                          ),
                        );
                      } else if (state is PostsError) {
                        return Text('error occuried ');
                      } else {
                        return LoadingPosts();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
