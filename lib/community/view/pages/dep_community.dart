import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:usm_mobile/community/bloc/community_bloc.dart';
import 'package:usm_mobile/community/bloc/post_bloc.dart';
import 'package:usm_mobile/community/models/post_response.dart';
import 'package:usm_mobile/community/services/CommunityService.dart';
import 'package:usm_mobile/community/services/Post_service.dart';
import 'package:usm_mobile/community/view/widgets/AddPost.dart';
import 'package:usm_mobile/community/view/widgets/community_body.dart';
import 'package:usm_mobile/community/view/widgets/community_footer.dart';
import 'package:usm_mobile/community/view/widgets/loading_posts.dart';
import 'package:usm_mobile/community/view/widgets/post_widget.dart';
import 'package:usm_mobile/community/view/widgets/user.dart';

class DepCommunity extends StatefulWidget {
  DepCommunity({Key key}) : super(key: key);

  @override
  _DepCommunityState createState() => _DepCommunityState();
}

class _DepCommunityState extends State<DepCommunity> {
  List<PostResponse> posts = List.empty(growable: true);

  int pageNo = 0;

  bool scrollInit = true;

  PostBloc postBloc;

  CommunityBloc communityBloc =
      CommunityBloc(communityServiceImpl: CommunityServiceImpl());

  ScrollController scrollController = ScrollController();
  Future<bool> _onWillPop(BuildContext context) async {
    print('${scrollController.offset}');
    if (scrollController.offset > 0) {
      scrollController.animateTo(0,
          duration: Duration(seconds: 1), curve: Curves.easeInOut);
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              (postBloc = PostBloc(postServiceImpl: PostServiceImpl()))
                ..add(
                  InitPosts(pageNo: 0),
                ),
        ),
        BlocProvider(
          create: (context) => (communityBloc =
              CommunityBloc(communityServiceImpl: CommunityServiceImpl()))
            ..add(
              InitCommunity(),
            ),
        ),
      ],
      child: WillPopScope(
        onWillPop: () => _onWillPop(context),
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () => Get.toNamed('/communityInfo'),
                  icon: Icon(Icons.info_outline))
            ],
            centerTitle: false,
            title: Text(
              'community name',
              style: TextStyle(fontFamily: 'Viado'),
            ),
          ),
          body: CommunityBody(
            scrollController: scrollController,
          ),
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
        ),
      ),
    );
  }
}
