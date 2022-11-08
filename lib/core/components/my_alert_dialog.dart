import 'package:flutter/cupertino.dart';
import 'package:score_board/cubit/timer/timer_cubit.dart';

class MyAlertDialog extends StatelessWidget {
  final VoidCallback onClicked;
  final String content;
  final TimerCubit timerCubit;
  const MyAlertDialog(
      {Key? key,
      required this.timerCubit,
      required this.content,
      required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      scrollController: ScrollController(keepScrollOffset: false),
      actionScrollController: ScrollController(keepScrollOffset: false),
      content: Text(
        content,
        style: const TextStyle(fontSize: 22),
      ),
      actions: [
        CupertinoButton(
            child: const Text("No"),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        CupertinoButton(
          child: const Text("Yes"),
          onPressed: onClicked,
        ),
      ],
    );
  }
}
