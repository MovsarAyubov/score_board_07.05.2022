import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:score_board/cubit/scoreboard_counter/scoreboard_counter_state.dart';

class ScoreboardCubit extends Cubit<ScoreboardCounterState> {
  ScoreboardCubit() : super(ScoreboardCounterState());

  final scoreboardState = ScoreboardCounterState();

  incrementHomeCounter({int count = 1}) {
    final instance =
        state.copyWith(homeScoreboard: state.homeScoreboard + count);
    emit(instance);
  }

  decrementHomeCounter() {
    emit(state.copyWith(
        homeScoreboard: state.homeScoreboard > 0
            ? state.homeScoreboard - 1
            : state.homeScoreboard));
  }

  incrementGuestCounter({int count = 1}) {
    emit(state.copyWith(guestScoreBoard: state.guestScoreBoard + count));
  }

  decrementGuestCounter() {
    emit(state.copyWith(
        guestScoreBoard: state.guestScoreBoard > 0
            ? state.guestScoreBoard - 1
            : state.guestScoreBoard));
  }

  resetCounter() {
    emit(state.copyWith(
        homeScoreboard: scoreboardState.homeScoreboard,
        guestScoreBoard: scoreboardState.guestScoreBoard));
  }
}
