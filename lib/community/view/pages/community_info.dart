import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:usm_mobile/community/services/CommunityService.dart';
import 'package:usm_mobile/community/bloc/community_bloc.dart';
import 'package:usm_mobile/community/view/widgets/community_footer.dart';

class CommunityInfo extends StatelessWidget {
  const CommunityInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommunityBloc(
        communityServiceImpl: CommunityServiceImpl(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Community Info'),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Desctiption :',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${loremIpsum(words: 100)}'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Members :',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        bottomNavigationBar: CommunityFooter(),
        floatingActionButton: FloatingActionButton(
            child: Container(
              child: Icon(
                Icons.search,
              ),
            ),
            onPressed: () {}),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
