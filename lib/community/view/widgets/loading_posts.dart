import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class LoadingPosts extends StatelessWidget {
  final String img;

  const LoadingPosts({Key key, this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade400,
      direction: ShimmerDirection.ltr,
      child: Container(
        // padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(vertical: 16),

        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.grey,
                      width: 100,
                      height: 15,
                    ),
                    Padding(padding: EdgeInsets.all(4)),
                    Container(
                      color: Colors.grey,
                      width: 50,
                      height: 15,
                    )
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.grey,
                width: Get.size.width,
                height: 200,
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 8.0),
            //   child: Image.asset(
            //     'assets/images/usm.png',
            //     fit: BoxFit.cover,
            //   ),
            // ),
            // Divider(
            //   color: Colors.black,
            // ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.thumb_up,
                    color: Color.fromARGB(255, 67, 66, 93),
                  ),
                  Icon(
                    Icons.message,
                    color: Color.fromARGB(255, 67, 66, 93),
                  ),
                  Icon(
                    Icons.more_horiz,
                    color: Color.fromARGB(255, 67, 66, 93),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
