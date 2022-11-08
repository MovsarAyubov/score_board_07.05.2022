// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ScoreboardCounterState {
  final int homeScoreboard;
  final int guestScoreBoard;
  final int lastAction;
  final int homeScoreboardLastValue;
  final int guestScoreboardLastValue;
  ScoreboardCounterState(
      {this.homeScoreboard = 0,
      this.guestScoreBoard = 0,
      this.lastAction = 0,
      this.homeScoreboardLastValue = 0,
      this.guestScoreboardLastValue = 0});

  ScoreboardCounterState copyWith(
      {int? homeScoreboard,
      int? guestScoreBoard,
      int? lastAction,
      int? homeScoreboardLastValue,
      int? guestScoreboardLastValue}) {
    return ScoreboardCounterState(
        homeScoreboard: homeScoreboard ?? this.homeScoreboard,
        guestScoreBoard: guestScoreBoard ?? this.guestScoreBoard,
        lastAction: lastAction ?? this.lastAction,
        homeScoreboardLastValue:
            homeScoreboardLastValue ?? this.homeScoreboardLastValue,
        guestScoreboardLastValue:
            guestScoreboardLastValue ?? this.guestScoreboardLastValue);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'homeScoreboard': homeScoreboard,
      'guestScoreBoard': guestScoreBoard,
      'lastAction': lastAction,
    };
  }

  factory ScoreboardCounterState.fromMap(Map<String, dynamic> map) {
    return ScoreboardCounterState(
      homeScoreboard: map['homeScoreboard'] as int,
      guestScoreBoard: map['guestScoreBoard'] as int,
      lastAction: map['lastAction'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ScoreboardCounterState.fromJson(String source) =>
      ScoreboardCounterState.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ScoreboardCounterState(homeScoreboard: $homeScoreboard, guestScoreBoard: $guestScoreBoard, lastAction: $lastAction)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ScoreboardCounterState &&
        other.homeScoreboard == homeScoreboard &&
        other.guestScoreBoard == guestScoreBoard &&
        other.lastAction == lastAction;
  }

  @override
  int get hashCode =>
      homeScoreboard.hashCode ^ guestScoreBoard.hashCode ^ lastAction.hashCode;
}
