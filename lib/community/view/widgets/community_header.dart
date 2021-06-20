import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usm_mobile/community/bloc/community_bloc.dart';
import 'package:usm_mobile/community/bloc/post_bloc.dart';
import 'package:usm_mobile/community/view/widgets/loading_users.dart';
import 'package:usm_mobile/community/view/widgets/user.dart';

class CommunityHeader extends StatelessWidget {
  CommunityHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommunityBloc, CommunityState>(
      builder: (context, state) {
        if (state is CommunityInitial) {
          return FlexibleSpaceBar(
            titlePadding: EdgeInsets.all(16),
            title: Text('loading'),
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
            title: IconButton(
              icon: Icon(Icons.replay_outlined),
              onPressed: () {
                BlocProvider.of<CommunityBloc>(context).add(InitCommunity());
                BlocProvider.of<PostBloc>(context).add(InitPosts());
              },
            ),
            background: ListView(
              scrollDirection: Axis.horizontal,
            ),
            centerTitle: true,
          );
        }
      },
    );
  }

  Function(BuildContext, bool) builder() =>
      (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 125.0,
            floating: false,
            pinned: true,
            snap: false,
            flexibleSpace: CommunityHeader(),
          ),
        ];
      };
}
