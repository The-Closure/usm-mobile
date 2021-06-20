import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:usm_mobile/community/bloc/comment_bloc.dart';
import 'package:usm_mobile/community/bloc/post_bloc.dart';
import 'package:usm_mobile/community/services/CommunityService.dart';
import 'package:usm_mobile/community/bloc/community_bloc.dart';
import 'package:usm_mobile/community/services/Post_service.dart';
import 'package:usm_mobile/community/view/widgets/AddPost.dart';
import 'package:usm_mobile/community/view/widgets/community_body.dart';
import 'package:usm_mobile/community/view/widgets/community_footer.dart';
import 'package:usm_mobile/community/view/widgets/community_header.dart';
import 'package:usm_mobile/community/view/widgets/loading_posts.dart';
import 'package:usm_mobile/community/view/widgets/loading_users.dart';
import 'package:usm_mobile/community/view/widgets/post_widget.dart';
import 'package:usm_mobile/community/view/widgets/user.dart';

//ignore: must_be_immutable

class Community extends StatelessWidget {
  ScrollController scroller = ScrollController(initialScrollOffset: 0);
  Future<bool> _onWillPop(BuildContext context) async {
    if (scroller.offset > 0) {
      scroller.animateTo(0,
          duration: Duration(seconds: 1), curve: Curves.easeInOut);
      return false;
    } else {
      return true;
    }
  }

  PostBloc postBloc;
  int pageNo = 0;

  @override
  Widget build(BuildContext context) {
    // final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    // int communityId = arguments['communityId'] as int;
    // RegisteredUser user = Get.arguments['userDetails'] as RegisteredUser;
    // int communityId = Get.arguments['communityId'] ?? 12;
    // user = arguments['userDetails'];
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              (postBloc = PostBloc(postServiceImpl: PostServiceImpl())
                ..add(InitPosts(pageNo: 0))),
        ),
        BlocProvider(
          create: (context) =>
              CommunityBloc(communityServiceImpl: CommunityServiceImpl())
                ..add(InitCommunity()),
        ),
      ],
      child: WillPopScope(
        onWillPop: () => _onWillPop(context),
        child: Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: CommunityFooter(),
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
            // controller: scroller
            //   ..addListener(() {
            //     if (scroller.position.pixels ==
            //         scroller.position.maxScrollExtent) {
            //       // Get.snackbar('message', 'max lines');
            //       postBloc.add(PagePosts(pageNo: pageNo += 1));
            //     }
            //   }),
            headerSliverBuilder: CommunityHeader().builder(),
            body: Column(
              children: [
                AddPost(),
                CommunityBody(
                  scrollController: scroller,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
