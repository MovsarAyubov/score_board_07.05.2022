import 'package:flutter/material.dart';
import 'package:score_board/core/app_colors/app_colors.dart';

class PlusPointsButton extends StatelessWidget {
  final String howMuchPoint;
  final Function function;
  final double opacity;
  const PlusPointsButton(
      {Key? key,
      required this.howMuchPoint,
      required this.function,
      required this.opacity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => function(),
        child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(opacity),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Center(
                child:
                    Text(howMuchPoint, style: const TextStyle(fontSize: 25)))));
  }
}

class UndoLastAction extends StatelessWidget {
  final IconData icon;
  final Function function;
  final double opacity;
  const UndoLastAction(
      {Key? key,
      required this.icon,
      required this.function,
      required this.opacity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => function(),
        child: Icon(
          icon,
          size: 30,
          color: Colors.white.withOpacity(opacity),
        ));
  }
}

class IncrementDecrementButton extends StatelessWidget {
  final double size;
  final Color color;
  final IconData icon;
  final Function function;
  const IncrementDecrementButton(
      {Key? key,
      required this.size,
      required this.icon,
      required this.function,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => function(),
        child: Icon(
          icon,
          size: size,
          color: color,
        ));
  }
}

class MyIconButton extends StatelessWidget {
  final double size;
  final VoidCallback onClicked;
  final IconData icon;
  final Color color;
  const MyIconButton({
    Key? key,
    required this.color,
    required this.size,
    required this.onClicked,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClicked,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: secondColor,
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Icon(
          icon,
          color: color,
          size: size,
        ),
      ),
    );
  }
}

class MyTextButton extends StatelessWidget {
  final VoidCallback onClicked;
  final String text;
  const MyTextButton({
    Key? key,
    required this.onClicked,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClicked,
      child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: secondColor,
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          child: Text(text,
              style: const TextStyle(fontSize: 24, color: Colors.white))),
    );
  }
}
