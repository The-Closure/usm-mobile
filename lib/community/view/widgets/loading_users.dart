import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingUsers extends StatelessWidget {
  final String img;

  const LoadingUsers({Key key, this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: Theme.of(context).primaryColor,
        child: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey,
        ),
      ),
    );
  }
}
