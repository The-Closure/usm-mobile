import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:usm_mobile/auth/models/RegisterdUser.dart';
import 'package:usm_mobile/community/services/CommunityService.dart';
import 'package:usm_mobile/community/bloc/community_bloc.dart';
import 'package:usm_mobile/community/view/widgets/loading_users.dart';
import 'package:usm_mobile/community/view/widgets/post.dart';
import 'package:usm_mobile/community/view/widgets/user.dart';

//ignore: must_be_immutable
class Community extends StatelessWidget {
  CommunityBloc communityBloc;
  Community({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    // int communityId = arguments['communityId'] as int;
    // RegisteredUser user = Get.arguments['userDetails'] as RegisteredUser;
    int communityId = Get.arguments['communityId'] as int;
    // if (arguments != null) print(arguments['userDetails']);
    // user = arguments['userDetails'];
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.person), onPressed: () {}),
            IconButton(icon: Icon(Icons.home), onPressed: () {}),
            Spacer(),
            IconButton(
                icon: Icon(Icons.account_balance_outlined), onPressed: () {}),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            BlocProvider(
              create: (context) {
                communityBloc = CommunityBloc(
                    communityServiceImpl: CommunityServiceImpl(),
                    communityId: communityId);
                communityBloc.add(InitCommunity());
                return communityBloc;
              },
              child: SliverAppBar(
                expandedHeight: 125.0,
                floating: false,
                pinned: false,
                snap: false,
                flexibleSpace: BlocBuilder<CommunityBloc, CommunityState>(
                  builder: (context, state) {
                    if (state is CommunityInitial) {
                      return FlexibleSpaceBar(
                        titlePadding: EdgeInsets.all(16),
                        title: Text('loading'),
                        background: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            LoadingUsers(),
                            LoadingUsers(),
                            LoadingUsers(),
                          ],
                        ),
                        centerTitle: true,
                      );
                    } else if (state is CommunityFetched) {
                      return FlexibleSpaceBar(
                        titlePadding: EdgeInsets.all(16),
                        title: Text(
                          '${state.community.name}',
                          style: TextStyle(fontSize: 12),
                        ),
                        background: ListView.builder(
                          itemCount: state.community.users.length,
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              onTap: () => print(state.community.users[index]
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
        body: ListView(
          padding: EdgeInsets.all(8),
          children: [
            Post(),
            Post(),
            Post(),
            Post(),
            Post(),
            Post(),
            Post(),
            Post(),
          ],
        ),
      ),
    );
  }
}
