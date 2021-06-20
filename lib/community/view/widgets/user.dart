import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:usm_mobile/community/view/widgets/loading_users.dart';

class User extends StatelessWidget {
  final String img;

  const User({Key key, this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: CircleAvatar(
        backgroundColor: Color.fromARGB(255, 67, 66, 93),
        radius: 20,
        child: ClipOval(
          child: img == null
              ? Image.asset(
                  'assets/images/user.jpg',
                )
              : CachedNetworkImage(
                  imageUrl: "$img",
                  placeholder: (context, url) => LoadingUsers(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
        ),
      ),
    );
  }
}
