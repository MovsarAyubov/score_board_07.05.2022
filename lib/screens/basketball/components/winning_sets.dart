import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:score_board/cubit/timer/timer_cubit.dart';

class WinningSets extends StatelessWidget {
  const WinningSets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.done,
      size: 30,
      color: Colors.white,
    );
  }
}

class WinningSetsRow extends StatelessWidget {
  final TimerCubit timerCubit;
  const WinningSetsRow({Key? key, required this.timerCubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: timerCubit,
        builder: (context, state) {
          if (timerCubit.state.numberOfSet == 1) {
            return const WinningSets();
          } else if (timerCubit.state.numberOfSet == 2) {
            return Row(children: const [WinningSets(), WinningSets()]);
          } else if (timerCubit.state.numberOfSet == 3) {
            return Row(
                children: const [WinningSets(), WinningSets(), WinningSets()]);
          } else if (timerCubit.state.numberOfSet == 4) {
            return Row(children: const [
              WinningSets(),
              WinningSets(),
              WinningSets(),
              WinningSets()
            ]);
          }
          return const SizedBox(
            height: 20,
          );
        });
  }
}
