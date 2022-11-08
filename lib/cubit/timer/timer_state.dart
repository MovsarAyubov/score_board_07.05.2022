class TimerState {
  final bool matchIsComplited;
  final bool isRunning;
  final int stopwatchMinutes;
  final int stopwatchSeconds;
  final int timerSeconds;
  final int numberOfSet;
  final int timeOfMatch;
  final int time;

  const TimerState(
      {this.matchIsComplited = false,
      this.isRunning = false,
      this.stopwatchMinutes = 0,
      this.stopwatchSeconds = 0,
      this.timerSeconds = 0,
      this.numberOfSet = 0,
      this.timeOfMatch = 6,
      this.time = 0});

  TimerState copyWith({
    bool? matchIsComplited,
    bool? isRunning,
    int? stopwatchMinutes,
    int? stopwatchSeconds,
    int? timerMinutes,
    int? timerSeconds,
    int? numberOfSet,
    int? timeOfMatch,
    int? time,
  }) {
    return TimerState(
      matchIsComplited: matchIsComplited ?? this.matchIsComplited,
      isRunning: isRunning ?? this.isRunning,
      stopwatchMinutes: stopwatchMinutes ?? this.stopwatchMinutes,
      stopwatchSeconds: stopwatchSeconds ?? this.stopwatchSeconds,
      timerSeconds: timerSeconds ?? this.timerSeconds,
      numberOfSet: numberOfSet ?? this.numberOfSet,
      timeOfMatch: timeOfMatch ?? this.timeOfMatch,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'matchIsComplited': matchIsComplited,
      'isRunning': isRunning,
      'stopwatchMinutes': stopwatchMinutes,
      'stopwatchSeconds': stopwatchSeconds,
      'timerSeconds': timerSeconds,
      'numberOfSet': numberOfSet,
      'timeOfMatch': timeOfMatch,
    };
  }

  factory TimerState.fromMap(Map<String, dynamic> map) {
    return TimerState(
      matchIsComplited: map['matchIsComplited'] as bool,
      isRunning: map['isRunning'] as bool,
      stopwatchMinutes: map['stopwatchMinutes'] as int,
      stopwatchSeconds: map['stopwatchSeconds'] as int,
      timerSeconds: map['timerSeconds'] as int,
      numberOfSet: map['numberOfSet'] as int,
      timeOfMatch: map['timeOfMatch'] as int,
    );
  }
}
