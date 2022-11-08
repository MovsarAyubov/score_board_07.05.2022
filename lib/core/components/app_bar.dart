import 'package:flutter/material.dart';
import 'package:score_board/core/app_colors/app_colors.dart';

class ScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const ScreenAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: secondColor,
      title: Center(
          child: Column(
        children: [
          const Text("Scoreboard", style: TextStyle(fontSize: 22)),
          const SizedBox(height: 3),
          Text(title),
        ],
      )),
      leading: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.arrow_back_ios_new),
      ),
      actions: [
        InkWell(
          onTap: () {},
          child: const Icon(
            Icons.more_vert_rounded,
            size: 34,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
