import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:score_board/core/app_colors/app_colors.dart';
import 'package:score_board/cubit/hydrated_cubit/match_history/match_history_cubit.dart';
import 'package:score_board/cubit/scoreboard_counter/scoreboard_counter_cubit.dart';
import 'package:score_board/cubit/scoreboard_team_name/team_name_cubit.dart';
import 'package:score_board/cubit/timer/timer_cubit.dart';

class MatchResult extends StatelessWidget {
  final MatchResultCubit matchResultCubit;
  final TeamNameCubit teamNameCubit;
  final ScoreboardCubit scoreboardCubit;
  final TimerCubit timerCubit;
  const MatchResult(
      {Key? key,
      required this.matchResultCubit,
      required this.teamNameCubit,
      required this.timerCubit,
      required this.scoreboardCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: scoreboardCubit,
        builder: (context, state) => CupertinoAlertDialog(
              content: Center(
                  child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(teamNameCubit.state.homeBoardName,
                        style: const TextStyle(fontSize: 24)),
                    Text(scoreboardCubit.state.homeScoreboard.toString(),
                        style: const TextStyle(fontSize: 24)),
                    const Text("-", style: TextStyle(fontSize: 24)),
                    Text(scoreboardCubit.state.guestScoreBoard.toString(),
                        style: const TextStyle(fontSize: 24)),
                    Text(teamNameCubit.state.guestBoardName,
                        style: const TextStyle(fontSize: 24)),
                  ],
                ),
              )),
              actions: [
                CupertinoButton(
                  onPressed: () {
                    timerCubit.resetTimer();
                    scoreboardCubit.resetCounter();
                    timerCubit.resetStopwatch();
                    timerCubit.resetNumberOfSet();
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.home_filled,
                    color: secondColor,
                    size: 30,
                  ),
                )
              ],
            ));
  }
}
