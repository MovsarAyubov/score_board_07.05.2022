import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:score_board/core/app_colors/app_colors.dart';
import 'package:score_board/core/components/buttons.dart';
import 'package:score_board/core/components/match_result.dart';
import 'package:score_board/core/components/my_alert_dialog.dart';
import 'package:score_board/cubit/hydrated_cubit/match_history/match_history_cubit.dart';
import 'package:score_board/cubit/scoreboard_counter/scoreboard_counter_cubit.dart';
import 'package:score_board/cubit/scoreboard_team_name/team_name_cubit.dart';
import 'package:score_board/cubit/timer/timer_cubit.dart';
import 'package:score_board/cubit/timer/timer_state.dart';
import 'package:score_board/model/history_of_match.dart';

class StartPauseButton extends StatelessWidget {
  final MatchResultCubit matchResultCubit;
  final TeamNameCubit teamNameCubit;
  final TimerCubit timerCubit;
  final ScoreboardCubit scoreboardCubit;
  const StartPauseButton(
      {Key? key,
      required this.matchResultCubit,
      required this.teamNameCubit,
      required this.timerCubit,
      required this.scoreboardCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TimerCubit, TimerState>(
      bloc: timerCubit,
      listenWhen: (previous, current) =>
          previous.matchIsComplited == false &&
          current.matchIsComplited == true,
      listener: (context, state) {
        matchResultCubit.addNewResult(HistoryOfMatch(
            firstTeamName: teamNameCubit.state.homeBoardName,
            secondTeamName: teamNameCubit.state.guestBoardName,
            time: DateTime.now(),
            firstTeamCounter: scoreboardCubit.state.homeScoreboard,
            secondTeamCounter: scoreboardCubit.state.guestScoreBoard));
        showDialog(
            context: context,
            builder: (context) => MatchResult(
                matchResultCubit: matchResultCubit,
                teamNameCubit: teamNameCubit,
                timerCubit: timerCubit,
                scoreboardCubit: scoreboardCubit));
      },
      builder: (context, state) {
        if (state.isRunning && state.matchIsComplited == false) {
          return Row(
            children: [
              InkWell(
                onTap: () {
                  timerCubit.stopTimerAndStopwatch();
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: secondColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  child: const Icon(
                    Icons.pause,
                    size: 70,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  timerCubit.stopTimerAndStopwatch();
                  showDialog(
                      context: context,
                      builder: (context) => MyAlertDialog(
                            content:
                                "Are you sure you want to start the set over?",
                            onClicked: () {
                              timerCubit.resetStopwatch();
                              Navigator.of(context).pop();
                            },
                            timerCubit: timerCubit,
                          ));
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: secondColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  child: const Icon(
                    Icons.restart_alt_rounded,
                    size: 70,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          );
        }
        if (state.isRunning == false &&
            state.matchIsComplited &&
            state.numberOfSet == 1) {
          return MyIconButton(
              color: Colors.white,
              size: 70,
              onClicked: () {
                scoreboardCubit.resetCounter();
                timerCubit.resetStopwatch();
                timerCubit.resetNumberOfSet();
              },
              icon: Icons.exit_to_app_rounded);
        }
        if (state.isRunning == false &&
            state.stopwatchMinutes == 0 &&
            state.stopwatchSeconds == 0) {
          return InkWell(
            onTap: () {
              timerCubit.startStopwatch();
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: secondColor,
                  borderRadius: const BorderRadius.all(Radius.circular(12))),
              child: const Icon(
                Icons.play_arrow,
                size: 70,
                color: Colors.white,
              ),
            ),
          );
        }
        return Row(
          children: [
            InkWell(
              onTap: () {
                timerCubit.startStopwatch();
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: secondColor,
                    borderRadius: const BorderRadius.all(Radius.circular(12))),
                child: const Icon(
                  Icons.play_arrow,
                  size: 70,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            MyIconButton(
                color: Colors.white,
                size: 70,
                onClicked: () {
                  showDialog(
                      context: context,
                      builder: (context) => MyAlertDialog(
                          timerCubit: timerCubit,
                          content: "Do you want to end the match?",
                          onClicked: () {
                            timerCubit.resetStopwatch();
                            scoreboardCubit.resetCounter();
                            timerCubit.resetNumberOfSet();
                            Navigator.of(context).pop();
                          }));
                },
                icon: Icons.exit_to_app_rounded),
          ],
        );
      },
    );
  }
}
