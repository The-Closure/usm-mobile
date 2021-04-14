import 'dart:ui';

import 'package:flutter/material.dart';

class Community extends StatelessWidget {
  const Community({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    // // RegisteredUser model = arguments['userDetails'] as RegisteredUser;
    // if (arguments != null) print(arguments['userDetails']);
    // // model = arguments['userDetails'];
    return Scaffold(
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
            SliverAppBar(
              expandedHeight: 125.0,
              floating: false,
              pinned: false,
              snap: false,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.all(16),
                title: Text('community name'),
                background: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 16),
                      child: CircleAvatar(backgroundColor: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 16),
                      child: CircleAvatar(backgroundColor: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 16),
                      child: CircleAvatar(backgroundColor: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 16),
                      child: CircleAvatar(backgroundColor: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 16),
                      child: CircleAvatar(backgroundColor: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 16),
                      child: CircleAvatar(backgroundColor: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 16),
                      child: CircleAvatar(backgroundColor: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 16),
                      child: CircleAvatar(backgroundColor: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 16),
                      child: CircleAvatar(backgroundColor: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 16),
                      child: CircleAvatar(backgroundColor: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 16),
                      child: CircleAvatar(backgroundColor: Colors.white),
                    ),
                  ],
                ),
                centerTitle: true,
              ),
            ),
          ];
        },
        body: Center(
          child: Text("Sample text"),
        ),
      ),
    );
  }
}
