import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:usm_mobile/community/models/ommunity_response.dart';
import 'package:usm_mobile/community/services/CommunityService.dart';
import 'package:usm_mobile/community/bloc/community_bloc.dart';
import 'package:usm_mobile/community/view/widgets/community_footer.dart';
import 'package:usm_mobile/community/view/widgets/user.dart';

class CommunityInfo extends StatelessWidget {
  CommunityInfo({Key key}) : super(key: key);
  final CommunityRespnse communityResponse = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommunityBloc(
        communityServiceImpl: CommunityServiceImpl(),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Community Info'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Get.size.width,
              height: Get.size.height / 3,
              child: communityResponse.img == null
                  ? FittedBox(
                      child: Image.asset('assets/images/community.png'),
                      fit: BoxFit.fill,
                    )
                  : Image.network('${communityResponse.img}'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Description :',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 5,
              child: SingleChildScrollView(
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Text(communityResponse.description ?? 'Error occuried'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Members :',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                alignment: Alignment.topLeft,
                height: 100,
                padding: EdgeInsets.all(8.0),
                child: ListView.builder(
                  // controller: scroller,
                  itemCount: communityResponse.users.length,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      child: Column(
                        children: [
                          User(
                            img: communityResponse.users[index].img,
                          ),
                          Text('${communityResponse.users[index].name}')
                        ],
                      ),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.transparent,
              ),
              flex: 6,
            )
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
