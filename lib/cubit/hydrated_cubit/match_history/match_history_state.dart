// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:score_board/model/history_of_match.dart';

class MatchResultState {
  final List<HistoryOfMatch> matchResult;
  const MatchResultState({
    required this.matchResult,
  });

  MatchResultState copyWith({
    List<HistoryOfMatch>? matchResult,
  }) {
    return MatchResultState(
      matchResult: matchResult ?? this.matchResult,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'matchResult': matchResult.map((x) => x.toMap()).toList(),
    };
  }

  factory MatchResultState.fromMap(Map<String, dynamic> map) {
    return MatchResultState(
      matchResult: List<HistoryOfMatch>.from(
        (map['matchResult'] as List<int>).map<HistoryOfMatch>(
          (x) => HistoryOfMatch.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MatchResultState.fromJson(String source) =>
      MatchResultState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MatchResultState(matchResult: $matchResult)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MatchResultState &&
        listEquals(other.matchResult, matchResult);
  }

  @override
  int get hashCode => matchResult.hashCode;
}
