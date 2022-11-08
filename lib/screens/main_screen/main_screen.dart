import 'package:flutter/material.dart';
import 'package:score_board/core/app_colors/app_colors.dart';
import 'package:score_board/core/components/buttons.dart';
import 'package:score_board/cubit/hydrated_cubit/match_history/match_history_cubit.dart';
import 'package:score_board/cubit/scoreboard_counter/scoreboard_counter_cubit.dart';
import 'package:score_board/cubit/scoreboard_team_name/team_name_cubit.dart';
import 'package:score_board/cubit/timer/timer_cubit.dart';
import 'package:score_board/screens/basketball/basketball_screen.dart';
import 'package:score_board/screens/football/football_screen.dart';
import 'package:score_board/screens/history_of_match/history_of_match.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final matchResultCubit = MatchResultCubit();
  final scoreboardCubit = ScoreboardCubit();
  final timerCubit = TimerCubit();
  final teamNameCubit = TeamNameCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: secondColor,
          title: const Center(
              child: Text("Scoreboard", style: TextStyle(color: Colors.white))),
        ),
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [gradient1, gradient2])),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyTextButton(
                    onClicked: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FootballScreen(
                                teamNameCubit: teamNameCubit,
                                timerCubit: timerCubit,
                                matchResultCubit: matchResultCubit,
                                scoreboardCubit: scoreboardCubit,
                              )));
                    },
                    text: "Football"),
                const SizedBox(height: 10),
                MyTextButton(
                    onClicked: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BasketballScreen(
                                matchResultCubit: matchResultCubit,
                                teamNameCubit: teamNameCubit,
                                timerCubit: timerCubit,
                                scoreboardCubit: scoreboardCubit,
                              )));
                    },
                    text: "Basketball"),
                const SizedBox(height: 10),
                MyTextButton(
                    onClicked: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => HistoryOfMatch(
                                matchResultCubit: matchResultCubit,
                              ))));
                    },
                    text: "History of match")
              ],
            ))));
  }
}
