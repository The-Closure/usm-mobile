import 'package:flutter/material.dart';
import '../../Models/BoardModel.dart';
import 'BoardImageWidget.dart';
import 'BoardTitleWidget.dart';
import 'DescriptionWidget.dart';
import 'MyDividerWidget.dart';
import 'ScholarShipsCardWidget.dart';
import 'ScholarShipsTitleWidget.dart';
import 'StaffWidget.dart';

class MyBoardPage extends StatelessWidget {
  BoardModel board;
  MyBoardPage(this.board);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BoardTitle(name: board.name),
        BoardImage(imgUrl: board.image),
        Description(description: board.description),
        (board.profs == null) ? Container() : MyDivider(),
        (board.profs == null)
            ? Container()
            : Align(
                alignment: Alignment.center,
                child: Staff(profs: board.profs),
              ),
        (board.scholarship == null) ? Container() : MyDivider(),
        (board.scholarship == null) ? Container() : ScholarShipsTitle(),
        (board.scholarship == null)
            ? Container()
            : Column(
                children: board.scholarship.map((e) {
                  return ScholarShipsCard(
                    img: "assets/images/logo.png",
                    title: e.title,
                    description: e.attach,
                  );
                }).toList(),
              ),
      ],
    );
  }
}
