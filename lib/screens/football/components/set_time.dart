import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:score_board/core/app_colors/app_colors.dart';
import 'package:score_board/core/components/buttons.dart';
import 'package:score_board/cubit/timer/timer_cubit.dart';
import 'package:score_board/cubit/timer/timer_state.dart';

class SetTime extends StatelessWidget {
  final TimerCubit timerCubit;
  const SetTime({Key? key, required this.timerCubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.only(top: 30),
      backgroundColor: secondColor,
      content: BlocBuilder<TimerCubit, TimerState>(
        bloc: timerCubit,
        builder: ((context, state) {
          return Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IncrementDecrementButton(
                    size: 30,
                    icon: Icons.arrow_back_ios,
                    function: () {
                      timerCubit.minusOneMinut();
                    },
                    color: Colors.white),
                const SizedBox(
                  width: 7,
                ),
                Text(state.timeOfMatch.toString().padLeft(2, "0"),
                    style: const TextStyle(fontSize: 50, color: Colors.white)),
                const SizedBox(
                  width: 7,
                ),
                IncrementDecrementButton(
                    size: 30,
                    icon: Icons.arrow_forward_ios,
                    function: () {
                      timerCubit.plusOneMinut();
                    },
                    color: Colors.white),
              ],
            ),
          );
        }),
      ),
      actions: [
        Center(
          child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Ok",
                  style: TextStyle(color: Colors.white, fontSize: 25))),
        )
      ],
    );
  }
}
