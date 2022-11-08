import 'package:flutter/material.dart';
import 'package:score_board/model/history_of_match.dart';
import 'package:jiffy/jiffy.dart';

class MyCard extends StatelessWidget {
  final HistoryOfMatch matchHistory;
  const MyCard({Key? key, required this.matchHistory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "${matchHistory.firstTeamName} ${matchHistory.firstTeamCounter} - ${matchHistory.secondTeamCounter} ${matchHistory.secondTeamName}",
                  style: const TextStyle(fontSize: 24)),
              Text(
                Jiffy(matchHistory.time).format('dd.MM.yy'),
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
