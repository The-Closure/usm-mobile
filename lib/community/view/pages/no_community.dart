import 'package:flutter/material.dart';
import 'package:usm_mobile/community/view/widgets/community_footer.dart';

class NoCommunity extends StatelessWidget {
  const NoCommunity({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Join Community'),
        centerTitle: true,
      ),
      bottomNavigationBar: CommunityFooter(),
    );
  }
}
