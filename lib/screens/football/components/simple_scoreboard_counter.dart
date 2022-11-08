import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:score_board/core/app_colors/app_colors.dart';
import 'package:score_board/core/components/buttons.dart';
import 'package:score_board/cubit/scoreboard_counter/scoreboard_counter_cubit.dart';
import 'package:score_board/cubit/scoreboard_counter/scoreboard_counter_state.dart';
import 'package:score_board/cubit/scoreboard_team_name/team_name_cubit.dart';
import 'package:score_board/cubit/scoreboard_team_name/team_name_state.dart';
import 'package:score_board/cubit/timer/timer_cubit.dart';
import 'package:score_board/cubit/timer/timer_state.dart';

class HomeScoreboardCounter extends StatelessWidget {
  final TeamNameCubit teamNameCubit;
  final TimerCubit timerCubit;
  final ScoreboardCubit scoreboardCubit;
  final Function incrementFunction;
  final Function decrementFunction;
  final String title;
  const HomeScoreboardCounter(
      {Key? key,
      required this.teamNameCubit,
      required this.timerCubit,
      required this.title,
      required this.incrementFunction,
      required this.decrementFunction,
      required this.scoreboardCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScoreboardCubit, ScoreboardCounterState>(
        bloc: scoreboardCubit,
        builder: ((context, state) {
          return Container(
            decoration: BoxDecoration(
                color: secondColor,
                borderRadius: const BorderRadius.all(Radius.circular(12))),
            height: 250,
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 35,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: Center(
                      child: BlocBuilder<TeamNameCubit, TeamNameState>(
                          bloc: teamNameCubit,
                          builder: (context, state) {
                            return TextFormField(
                              onFieldSubmitted: (name) {
                                teamNameCubit.setHomeBoardName(name);
                              },
                              style: const TextStyle(fontSize: 24),
                              initialValue: teamNameCubit.state.homeBoardName,
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            );
                          })),
                ),
                BlocBuilder<TimerCubit, TimerState>(
                  bloc: timerCubit,
                  builder: (context, state) {
                    if (state.isRunning) {
                      return IncrementDecrementButton(
                          size: 60,
                          color: Colors.white,
                          icon: Icons.arrow_drop_up,
                          function: incrementFunction);
                    }
                    return IncrementDecrementButton(
                        size: 60,
                        color: const Color.fromARGB(255, 126, 126, 126),
                        icon: Icons.arrow_drop_up,
                        function: () {});
                  },
                ),
                Text(
                  state.homeScoreboard.toString(),
                  style: const TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                BlocBuilder<TimerCubit, TimerState>(
                    bloc: timerCubit,
                    builder: (context, state) {
                      if (state.isRunning) {
                        return IncrementDecrementButton(
                            size: 60,
                            color: Colors.white,
                            icon: Icons.arrow_drop_down,
                            function: decrementFunction);
                      }
                      return IncrementDecrementButton(
                          size: 60,
                          color: const Color.fromARGB(255, 126, 126, 126),
                          icon: Icons.arrow_drop_down,
                          function: () {});
                    })
              ],
            ),
          );
        }));
  }
}

class GuestScoreboardCounter extends StatelessWidget {
  final TeamNameCubit teamNameCubit;
  final TimerCubit timerCubit;
  final ScoreboardCubit scoreboardCubit;
  final Function incrementFunction;
  final Function decrementFunction;
  final String title;
  const GuestScoreboardCounter(
      {Key? key,
      required this.teamNameCubit,
      required this.timerCubit,
      required this.title,
      required this.incrementFunction,
      required this.decrementFunction,
      required this.scoreboardCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScoreboardCubit, ScoreboardCounterState>(
        bloc: scoreboardCubit,
        builder: ((context, state) {
          return Container(
            decoration: BoxDecoration(
                color: secondColor,
                borderRadius: const BorderRadius.all(Radius.circular(12))),
            height: 250,
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 35,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: Center(
                      child: BlocBuilder<TeamNameCubit, TeamNameState>(
                          bloc: teamNameCubit,
                          builder: (context, state) {
                            return Center(
                              child: TextFormField(
                                onFieldSubmitted: (name) {
                                  teamNameCubit.setGuestBoardName(name);
                                },
                                style: const TextStyle(fontSize: 24),
                                initialValue:
                                    teamNameCubit.state.guestBoardName,
                                textAlign: TextAlign.center,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            );
                          })),
                ),
                BlocBuilder<TimerCubit, TimerState>(
                  bloc: timerCubit,
                  builder: (context, state) {
                    if (state.isRunning) {
                      return IncrementDecrementButton(
                          size: 60,
                          color: Colors.white,
                          icon: Icons.arrow_drop_up,
                          function: incrementFunction);
                    }
                    return IncrementDecrementButton(
                        size: 60,
                        color: const Color.fromARGB(255, 126, 126, 126),
                        icon: Icons.arrow_drop_up,
                        function: () {});
                  },
                ),
                Text(
                  state.guestScoreBoard.toString(),
                  style: const TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                BlocBuilder<TimerCubit, TimerState>(
                    bloc: timerCubit,
                    builder: (context, state) {
                      if (state.isRunning) {
                        return IncrementDecrementButton(
                            size: 60,
                            color: Colors.white,
                            icon: Icons.arrow_drop_down,
                            function: decrementFunction);
                      }
                      return IncrementDecrementButton(
                          size: 60,
                          color: const Color.fromARGB(255, 126, 126, 126),
                          icon: Icons.arrow_drop_down,
                          function: () {});
                    })
              ],
            ),
          );
        }));
  }
}
