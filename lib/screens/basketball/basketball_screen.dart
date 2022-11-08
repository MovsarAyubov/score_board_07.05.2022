import 'package:flutter/material.dart';
import 'package:score_board/core/app_colors/app_colors.dart';
import 'package:score_board/core/components/app_bar.dart';
import 'package:score_board/core/components/number_of_set.dart';
import 'package:score_board/cubit/hydrated_cubit/match_history/match_history_cubit.dart';
import 'package:score_board/cubit/scoreboard_team_name/team_name_cubit.dart';
import 'package:score_board/screens/basketball/components/basketball_scoreboard_counter.dart';
import 'package:score_board/cubit/scoreboard_counter/scoreboard_counter_cubit.dart';
import 'package:score_board/cubit/timer/timer_cubit.dart';
import 'package:score_board/screens/basketball/components/buttons.dart';
import 'package:score_board/screens/basketball/components/scorboard_timer.dart';

class BasketballScreen extends StatelessWidget {
  final MatchResultCubit matchResultCubit;
  final ScoreboardCubit scoreboardCubit;
  final TimerCubit timerCubit;
  final TeamNameCubit teamNameCubit;
  const BasketballScreen(
      {Key? key,
      required this.teamNameCubit,
      required this.matchResultCubit,
      required this.scoreboardCubit,
      required this.timerCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ScreenAppBar(title: "BasketBall"),
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [gradient1, gradient2])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NumberOfSet(
              timerCubit: timerCubit,
            ),
            const SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HomeScoreboardCounter(
                  teamNameCubit: teamNameCubit,
                  timerCubit: timerCubit,
                  scoreboardCubit: scoreboardCubit,
                ),
                const SizedBox(
                  width: 40,
                ),
                Column(
                  children: [
                    ScoreBoardTimer(
                      timerCubit: timerCubit,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    StartPauseButton(
                      matchResultCubit: matchResultCubit,
                      teamNameCubit: teamNameCubit,
                      scoreboardCubit: scoreboardCubit,
                      timerCubit: timerCubit,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 40,
                ),
                GuestScoreboardCounter(
                  teamNameCubit: teamNameCubit,
                  timerCubit: timerCubit,
                  scoreboardCubit: scoreboardCubit,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
