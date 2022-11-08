import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:score_board/core/app_colors/app_colors.dart';
import 'package:score_board/core/components/buttons.dart';
import 'package:score_board/cubit/timer/timer_cubit.dart';
import 'package:score_board/cubit/timer/timer_state.dart';
import 'package:score_board/screens/basketball/components/set_time.dart';

class ScoreBoardTimer extends StatelessWidget {
  final TimerCubit timerCubit;
  const ScoreBoardTimer({
    Key? key,
    required this.timerCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 120,
      child: Column(
        children: [
          Container(
            height: 35,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12))),
            child: Center(
                child: BlocBuilder<TimerCubit, TimerState>(
              bloc: timerCubit,
              builder: (context, state) {
                return Text(
                  "Time ${timerCubit.state.timeOfMatch} mins",
                  style: const TextStyle(fontSize: 24),
                );
              },
            )),
          ),
          const SizedBox(height: 8),
          TimerCard(
            timerCubit: timerCubit,
          )
        ],
      ),
      decoration: BoxDecoration(
          color: secondColor,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}

class TimerCard extends StatelessWidget {
  final TimerCubit timerCubit;
  const TimerCard({
    Key? key,
    required this.timerCubit,
  }) : super(key: key);
  String twoDigits(int n) => n.toString().padLeft(2, "0");

  final timerState = const TimerState();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, TimerState>(
        bloc: timerCubit,
        builder: (context, state) {
          return Row(
            children: [
              const SizedBox(
                width: 60,
              ),
              Text(
                  "${timerCubit.state.stopwatchMinutes.toString().padLeft(2, "0")}:${timerCubit.state.stopwatchSeconds.toString().padLeft(2, "0")}",
                  style: const TextStyle(fontSize: 65, color: Colors.white)),
              const SizedBox(
                width: 5,
              ),
              state.stopwatchSeconds == 0 &&
                      state.isRunning == false &&
                      state.numberOfSet == 0
                  ? MyIconButton(
                      color: Colors.white,
                      size: 30,
                      onClicked: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return SetTime(
                                timerCubit: timerCubit,
                              );
                            });
                      },
                      icon: Icons.settings)
                  : MyIconButton(
                      color: Colors.white.withOpacity(0.3),
                      size: 30,
                      onClicked: () {},
                      icon: Icons.settings)
            ],
          );
        });
  }
}
