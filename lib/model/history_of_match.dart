// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HistoryOfMatch {
  final String firstTeamName;
  final String secondTeamName;
  final DateTime time;
  final int firstTeamCounter;
  final int secondTeamCounter;

  const HistoryOfMatch({
    required this.firstTeamName,
    required this.secondTeamName,
    required this.time,
    required this.firstTeamCounter,
    required this.secondTeamCounter,
  });

  HistoryOfMatch copyWith({
    String? firstTeamName,
    String? secondTeamName,
    DateTime? time,
    int? firstTeamCounter,
    int? secondTeamCounter,
  }) {
    return HistoryOfMatch(
      firstTeamName: firstTeamName ?? this.firstTeamName,
      secondTeamName: secondTeamName ?? this.secondTeamName,
      time: time ?? this.time,
      firstTeamCounter: firstTeamCounter ?? this.firstTeamCounter,
      secondTeamCounter: secondTeamCounter ?? this.secondTeamCounter,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstTeamName': firstTeamName,
      'secondTeamName': secondTeamName,
      'time': time.millisecondsSinceEpoch,
      'firstTeamCounter': firstTeamCounter,
      'secondTeamCounter': secondTeamCounter,
    };
  }

  factory HistoryOfMatch.fromMap(Map<String, dynamic> map) {
    return HistoryOfMatch(
      firstTeamName: map['firstTeamName'] as String,
      secondTeamName: map['secondTeamName'] as String,
      time: DateTime.fromMillisecondsSinceEpoch(map['time'] as int),
      firstTeamCounter: map['firstTeamCounter'] as int,
      secondTeamCounter: map['secondTeamCounter'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoryOfMatch.fromJson(String source) =>
      HistoryOfMatch.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HistoryOfMatch(firstTeamName: $firstTeamName, secondTeamName: $secondTeamName, time: $time, firstTeamCounter: $firstTeamCounter, secondTeamCounter: $secondTeamCounter)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HistoryOfMatch &&
        other.firstTeamName == firstTeamName &&
        other.secondTeamName == secondTeamName &&
        other.time == time &&
        other.firstTeamCounter == firstTeamCounter &&
        other.secondTeamCounter == secondTeamCounter;
  }

  @override
  int get hashCode {
    return firstTeamName.hashCode ^
        secondTeamName.hashCode ^
        time.hashCode ^
        firstTeamCounter.hashCode ^
        secondTeamCounter.hashCode;
  }
}

class HistoryOfMatchList {
  static List<HistoryOfMatch> getResultOfMatch() {
    return [];
  }
}
