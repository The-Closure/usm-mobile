import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usm_mobile/community/bloc/post_bloc.dart';
import 'package:usm_mobile/community/models/post_response.dart';

class AddPost extends StatefulWidget {
  AddPost({Key key}) : super(key: key);

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  TextEditingController postContentController = TextEditingController();
  double padding = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostBloc, PostState>(
      listener: (context, state) {
        // if (state is PostAddedState) {
        //   widget.posts.add(state.postResponse);
        //   BlocProvider.of<PostBloc>(context).add(InitPosts());
        //   Get.snackbar('message', 'post added');
        // } else if (state is FaildAddPostState) {
        //   Get.snackbar('Error', '${state.error}');
        // }
      },
      builder: (context, state) {
        if (state is AddingPostState) {
          return LinearProgressIndicator();
        } else
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            // margin: EdgeInsets.only(top: 100),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                border: Border.all(
                    width: 2, style: BorderStyle.solid, color: Colors.grey)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: TextField(
                    controller: postContentController,
                    maxLines: 2,
                    decoration:
                        InputDecoration.collapsed(hintText: "share your ideas"),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    BlocProvider.of<PostBloc>(context).add(
                      AddPostEvent(
                        value: postContentController.text,
                        userID: await SharedPreferences.getInstance().then(
                          (value) => value.getInt('userID'),
                        ),
                      ),
                    );
                    postContentController.clear();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).primaryColor,
                    ),
                    alignment: Alignment.center,
                    width: Get.size.width,
                    height: 25,
                    child: Text(
                      'add post',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          );
      },
    );
  }
}
