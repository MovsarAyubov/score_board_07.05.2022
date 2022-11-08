import 'package:flutter/material.dart';
import 'package:score_board/core/components/app_bar.dart';
import 'package:score_board/core/components/number_of_set.dart';
import 'package:score_board/core/app_colors/app_colors.dart';
import 'package:score_board/cubit/hydrated_cubit/match_history/match_history_cubit.dart';
import 'package:score_board/cubit/scoreboard_counter/scoreboard_counter_cubit.dart';
import 'package:score_board/cubit/scoreboard_team_name/team_name_cubit.dart';
import 'package:score_board/cubit/timer/timer_cubit.dart';
import 'package:score_board/screens/football/components/buttons.dart';
import 'package:score_board/screens/football/components/scorboard_timer.dart';
import 'components/simple_scoreboard_counter.dart';

class FootballScreen extends StatefulWidget {
  final MatchResultCubit matchResultCubit;
  final ScoreboardCubit scoreboardCubit;
  final TimerCubit timerCubit;
  final TeamNameCubit teamNameCubit;
  const FootballScreen(
      {Key? key,
      required this.matchResultCubit,
      required this.scoreboardCubit,
      required this.teamNameCubit,
      required this.timerCubit})
      : super(key: key);

  @override
  State<FootballScreen> createState() => _FootballScreenState();
}

class _FootballScreenState extends State<FootballScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ScreenAppBar(title: "Football"),
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [gradient1, gradient2])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NumberOfSet(
              timerCubit: widget.timerCubit,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HomeScoreboardCounter(
                    teamNameCubit: widget.teamNameCubit,
                    timerCubit: widget.timerCubit,
                    scoreboardCubit: widget.scoreboardCubit,
                    incrementFunction: () =>
                        widget.scoreboardCubit.incrementHomeCounter(),
                    decrementFunction: () =>
                        widget.scoreboardCubit.decrementHomeCounter(),
                    title: "home"),
                const SizedBox(
                  width: 40,
                ),
                Column(
                  children: [
                    ScoreBoardTimer(
                      timerCubit: widget.timerCubit,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    StartPauseButton(
                      matchResultCubit: widget.matchResultCubit,
                      teamNameCubit: widget.teamNameCubit,
                      scoreboardCubit: widget.scoreboardCubit,
                      timerCubit: widget.timerCubit,
                    )
                  ],
                ),
                const SizedBox(
                  width: 40,
                ),
                GuestScoreboardCounter(
                  teamNameCubit: widget.teamNameCubit,
                  timerCubit: widget.timerCubit,
                  scoreboardCubit: widget.scoreboardCubit,
                  incrementFunction: () =>
                      widget.scoreboardCubit.incrementGuestCounter(),
                  decrementFunction: () =>
                      widget.scoreboardCubit.decrementGuestCounter(),
                  title: 'guest',
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
