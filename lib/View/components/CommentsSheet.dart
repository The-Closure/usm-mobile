import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usm_mobile/Models/CommentModel.dart';
import 'package:usm_mobile/Models/PostModel.dart';

Widget CommentsSheet(BuildContext context, List<Comment> comments) {
  return Container(
    padding: EdgeInsets.all(5),
    child: ListView(
      children: ListTile.divideTiles(
        context: context,
        tiles: comments
            .map((e) => ListTile(
                  title: Text(e.name),
                  subtitle: Text(e.value),
                ))
            .toList(),
      ).toList(),
    ),
  );
}
