import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:score_board/cubit/hydrated_cubit/match_history/match_history_cubit.dart';
import 'package:score_board/cubit/timer/timer_state.dart';
import 'package:audioplayers/audioplayers.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(const TimerState());
  Timer? timer;
  final timerState = const TimerState();
  final AudioCache whistle = AudioCache();
  final matchResultCubit = MatchResultCubit();

  startStopwatch() {
    if (state.timeOfMatch == 0) {
      emit(state.copyWith(isRunning: false));
    }

    if (state.stopwatchMinutes < state.timeOfMatch) {
      emit(state.copyWith(isRunning: true));
      timer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (state.stopwatchMinutes == state.timeOfMatch - 1 &&
            state.stopwatchSeconds == 9) {
          stopTimerAndStopwatch();
          whistle.play("whistle.mp3");
          emit(state.copyWith(isRunning: false));
          emit(state.copyWith(matchIsComplited: true));
        }
        emit(state.copyWith(stopwatchSeconds: state.stopwatchSeconds + 1));
        if (state.stopwatchSeconds == 10) {
          emit(state.copyWith(
              stopwatchSeconds: 0,
              stopwatchMinutes: state.stopwatchMinutes + 1));
        }
        if (state.timeOfMatch % 2 != 0 &&
            state.stopwatchMinutes == (state.timeOfMatch - 1) / 2 &&
            state.stopwatchSeconds == 10 / 2) {
          emit(state.copyWith(numberOfSet: state.numberOfSet + 1));
          stopTimerAndStopwatch();
          whistle.play("whistle.mp3");
        }
        if (state.stopwatchMinutes == state.timeOfMatch / 2 &&
            state.stopwatchSeconds == 0) {
          emit(state.copyWith(numberOfSet: state.numberOfSet + 1));
          stopTimerAndStopwatch();
          whistle.play("whistle.mp3");
        }
      });
    }
  }

  startTimer() {
    if (state.timeOfMatch == 0) {
      emit(state.copyWith(isRunning: false));
    }
    if (state.timeOfMatch > 0) {
      emit(state.copyWith(isRunning: true));
      timer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (state.timerSeconds == 0) {
          emit(state.copyWith(
              timeOfMatch: state.timeOfMatch - 1, timerSeconds: 2));
        }
        if (state.timerSeconds > 0) {
          emit(state.copyWith(timerSeconds: state.timerSeconds - 1));
        }
        if (state.timeOfMatch == 0 && state.timerSeconds == 0) {
          whistle.play("whistle.mp3");
          resetTimer();
          emit(state.copyWith(numberOfSet: state.numberOfSet + 1));
          emit(state.copyWith(isRunning: false));
          timer?.cancel();
        }
        if (state.numberOfSet == 4) {
          timer?.cancel();
          emit(state.copyWith(matchIsComplited: true));
        }
      });
    }
  }

  stopTimerAndStopwatch() {
    emit(state.copyWith(isRunning: false));
    timer?.cancel();
  }

  resetTimer() {
    emit(state.copyWith(matchIsComplited: false));
    stopTimerAndStopwatch();
    emit(state.copyWith(
      timerSeconds: timerState.timerSeconds,
      timeOfMatch: state.time,
    ));
  }

  resetNumberOfSet() {
    emit(state.copyWith(numberOfSet: timerState.numberOfSet));
  }

  resetStopwatch() {
    emit(state.copyWith(isRunning: false));
    stopTimerAndStopwatch();
    emit(state.copyWith(
        stopwatchMinutes: timerState.stopwatchMinutes,
        stopwatchSeconds: timerState.stopwatchSeconds));
  }

  plusOneMinut() {
    emit(state.copyWith(
      timeOfMatch: state.timeOfMatch + 1,
    ));
  }

  minusOneMinut() {
    if (state.timeOfMatch > 0) {
      emit(
        state.copyWith(
          timeOfMatch: state.timeOfMatch - 1,
        ),
      );
    }
  }

  setTime() {
    emit(state.copyWith(time: state.timeOfMatch));
  }
}
