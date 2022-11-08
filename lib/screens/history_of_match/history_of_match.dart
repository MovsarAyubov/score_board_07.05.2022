import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:score_board/core/app_colors/app_colors.dart';
import 'package:score_board/core/components/app_bar.dart';
import 'package:score_board/cubit/hydrated_cubit/match_history/match_history_cubit.dart';
import 'package:score_board/cubit/hydrated_cubit/match_history/match_history_state.dart';
import 'package:score_board/screens/history_of_match/components/match_result_card.dart';

class HistoryOfMatch1 extends StatefulWidget {
  final MatchResultCubit matchResultCubit;
  const HistoryOfMatch1({Key? key, required this.matchResultCubit})
      : super(key: key);

  @override
  State<HistoryOfMatch1> createState() => _HistoryOfMatchState();
}

class _HistoryOfMatchState extends State<HistoryOfMatch1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const ScreenAppBar(title: "History of matchs"),
        backgroundColor: secondColor,
        body: Center(
          child: Container(
              padding: const EdgeInsets.only(left: 70),
              width: 350,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: BlocBuilder<MatchResultCubit, MatchResultState>(
                bloc: widget.matchResultCubit,
                builder: (context, state) {
                  return Center(
                    child: ListView.builder(
                        itemCount: state.matchResult.length,
                        itemBuilder: (context, index) => Column(
                              children: [
                                Row(
                                  children: [
                                    MyCard(
                                        matchHistory: state.matchResult[index]),
                                    Expanded(
                                      child: IconButton(
                                          color: Colors.red,
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    CupertinoAlertDialog(
                                                      content: const Text(
                                                          "Delete result?",
                                                          style: TextStyle(
                                                              fontSize: 24)),
                                                      actions: [
                                                        CupertinoButton(
                                                            child: const Text(
                                                                "OK",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18)),
                                                            onPressed: () {
                                                              widget
                                                                  .matchResultCubit
                                                                  .removeResult(
                                                                      index);
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            }),
                                                        CupertinoButton(
                                                            child: const Text(
                                                                "NO",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18)),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            })
                                                      ],
                                                    ));
                                          },
                                          icon: const Icon(Icons.delete)),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  color: Colors.black,
                                ),
                              ],
                            )),
                  );
                },
              )),
        ));
  }
}

class HistoryOfMatch extends StatelessWidget {
  final MatchResultCubit matchResultCubit;
  const HistoryOfMatch({Key? key, required this.matchResultCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const ScreenAppBar(title: "History of matchs"),
        backgroundColor: secondColor,
        body: Center(
          child: Container(
              padding: const EdgeInsets.only(left: 70),
              width: 350,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: BlocBuilder<MatchResultCubit, MatchResultState>(
                bloc: matchResultCubit,
                builder: (context, state) {
                  return Center(
                    child: ListView.builder(
                        itemCount: state.matchResult.length,
                        itemBuilder: (context, index) => Column(
                              children: [
                                Row(
                                  children: [
                                    MyCard(
                                        matchHistory: state.matchResult[index]),
                                    Expanded(
                                      child: IconButton(
                                          color: Colors.red,
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    CupertinoAlertDialog(
                                                      content: const Text(
                                                          "Delete result?",
                                                          style: TextStyle(
                                                              fontSize: 24)),
                                                      actions: [
                                                        CupertinoButton(
                                                            child: const Text(
                                                                "OK",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18)),
                                                            onPressed: () {
                                                              matchResultCubit
                                                                  .removeResult(
                                                                      index);
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            }),
                                                        CupertinoButton(
                                                            child: const Text(
                                                                "NO",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18)),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            })
                                                      ],
                                                    ));
                                          },
                                          icon: const Icon(Icons.delete)),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  color: Colors.black,
                                ),
                              ],
                            )),
                  );
                },
              )),
        ));
  }
}
