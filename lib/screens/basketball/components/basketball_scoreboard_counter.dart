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
  final ScoreboardCubit scoreboardCubit;
  final TimerCubit timerCubit;
  const HomeScoreboardCounter(
      {Key? key,
      required this.teamNameCubit,
      required this.scoreboardCubit,
      required this.timerCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScoreboardCubit, ScoreboardCounterState>(
        bloc: scoreboardCubit,
        builder: ((context, state) {
          return Container(
            padding: const EdgeInsets.only(bottom: 10),
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
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: BlocBuilder<TimerCubit, TimerState>(
                        bloc: timerCubit,
                        builder: (context, state) {
                          if (state.isRunning) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                PlusPointsButton(
                                  opacity: 1,
                                  howMuchPoint: "+3",
                                  function: () => scoreboardCubit
                                      .incrementHomeCounter(count: 3),
                                ),
                                PlusPointsButton(
                                  opacity: 1,
                                  howMuchPoint: "+2",
                                  function: () => scoreboardCubit
                                      .incrementHomeCounter(count: 2),
                                ),
                                PlusPointsButton(
                                  opacity: 1,
                                  howMuchPoint: "+1",
                                  function: () => scoreboardCubit
                                      .incrementHomeCounter(count: 1),
                                ),
                              ],
                            );
                          }
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PlusPointsButton(
                                opacity: 0.3,
                                howMuchPoint: "+3",
                                function: () => () {},
                              ),
                              PlusPointsButton(
                                opacity: 0.3,
                                howMuchPoint: "+2",
                                function: () => () {},
                              ),
                              PlusPointsButton(
                                opacity: 0.3,
                                howMuchPoint: "+1",
                                function: () => () {},
                              ),
                            ],
                          );
                        })),
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
                        return Expanded(
                          child: UndoLastAction(
                              opacity: 1,
                              icon: Icons.undo_rounded,
                              function: () =>
                                  scoreboardCubit.decrementHomeCounter()),
                        );
                      }
                      return Expanded(
                        child: UndoLastAction(
                            opacity: 0.5,
                            icon: Icons.undo_rounded,
                            function: () => () {}),
                      );
                    })
              ],
            ),
          );
        }));
  }
}

class GuestScoreboardCounter extends StatelessWidget {
  final TeamNameCubit teamNameCubit;
  final ScoreboardCubit scoreboardCubit;
  final TimerCubit timerCubit;
  const GuestScoreboardCounter(
      {Key? key,
      required this.teamNameCubit,
      required this.scoreboardCubit,
      required this.timerCubit})
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
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: BlocBuilder<TimerCubit, TimerState>(
                        bloc: timerCubit,
                        builder: (context, state) {
                          if (state.isRunning) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                PlusPointsButton(
                                  opacity: 1,
                                  howMuchPoint: "+3",
                                  function: () => scoreboardCubit
                                      .incrementGuestCounter(count: 3),
                                ),
                                PlusPointsButton(
                                  opacity: 1,
                                  howMuchPoint: "+2",
                                  function: () => scoreboardCubit
                                      .incrementGuestCounter(count: 2),
                                ),
                                PlusPointsButton(
                                  opacity: 1,
                                  howMuchPoint: "+1",
                                  function: () => scoreboardCubit
                                      .incrementGuestCounter(count: 1),
                                ),
                              ],
                            );
                          }
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PlusPointsButton(
                                opacity: 0.3,
                                howMuchPoint: "+3",
                                function: () => () {},
                              ),
                              PlusPointsButton(
                                opacity: 0.3,
                                howMuchPoint: "+2",
                                function: () => () {},
                              ),
                              PlusPointsButton(
                                opacity: 0.3,
                                howMuchPoint: "+1",
                                function: () => () {},
                              ),
                            ],
                          );
                        })),
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
                        return Expanded(
                          child: UndoLastAction(
                              opacity: 1,
                              icon: Icons.undo_rounded,
                              function: () =>
                                  scoreboardCubit.decrementGuestCounter()),
                        );
                      }
                      return Expanded(
                        child: UndoLastAction(
                            opacity: 0.5,
                            icon: Icons.undo_rounded,
                            function: () => () {}),
                      );
                    })
              ],
            ),
          );
        }));
  }
}

// class HomeScoreboardCounter extends StatelessWidget {
//   final ScoreboardCubit scoreboardCubit;
//   final String title;
//   HomeScoreboardCounter(
//       {Key? key, required this.title, required this.scoreboardCubit})
//       : super(key: key);

//   final timerCubit = TimerCubit();
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ScoreboardCubit, ScoreboardCounterState>(
//         bloc: scoreboardCubit,
//         builder: ((context, state) {
//           return Container(
//             padding: const EdgeInsets.only(bottom: 10),
//             decoration: BoxDecoration(
//                 color: secondColor,
//                 borderRadius: const BorderRadius.all(Radius.circular(12))),
//             height: 250,
//             width: 150,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Container(
//                   height: 35,
//                   decoration: const BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(10),
//                           topRight: Radius.circular(10))),
//                   child: Center(
//                       child: Text(title.toUpperCase(),
//                           style: const TextStyle(fontSize: 24))),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       PlusPointsButton(
//                         howMuchPoint: "+3",
//                         function: () =>
//                             scoreboardCubit.incrementHomeCounter(count: 3),
//                       ),
//                       PlusPointsButton(
//                         howMuchPoint: "+2",
//                         function: () =>
//                             scoreboardCubit.incrementHomeCounter(count: 2),
//                       ),
//                       PlusPointsButton(
//                         howMuchPoint: "+1",
//                         function: () =>
//                             scoreboardCubit.incrementHomeCounter(count: 1),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Text(
//                   state.homeScoreboard.toString(),
//                   style: const TextStyle(
//                       fontSize: 80,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white),
//                 ),
//                 Expanded(
//                   child: UndoLastAction(
//                       icon: Icons.undo_rounded,
//                       function: () => scoreboardCubit.decrementHomeCounter()),
//                 )
//               ],
//             ),
//           );
//         }));
//   }
// }