import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:score_board/cubit/timer/timer_cubit.dart';
import 'package:score_board/cubit/timer/timer_state.dart';

class NumberOfSet extends StatelessWidget {
  final TimerCubit timerCubit;
  const NumberOfSet({Key? key, required this.timerCubit})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, TimerState>(
        bloc: timerCubit,
        builder: (context, state) {
          return Text(
              "Set: ${state.numberOfSet < 4 ? state.numberOfSet + 1 : 4}",
              style: const TextStyle(color: Colors.white, fontSize: 22));
        });
  }
}
