import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:score_board/cubit/hydrated_cubit/match_history/match_history_state.dart';
import 'package:score_board/model/history_of_match.dart';

@singleton
class MatchResultCubit extends HydratedCubit<MatchResultState> {
  MatchResultCubit() : super(const MatchResultState(matchResult: []));

  void addNewResult(HistoryOfMatch result) {
    final results = List<HistoryOfMatch>.from(state.matchResult)..add(result);
    emit(state.copyWith(matchResult: results));
  }

  void removeResult(int index) {
    final removeResult = List<HistoryOfMatch>.from(state.matchResult)
      ..removeAt(index);
    emit(state.copyWith(matchResult: removeResult));
  }

  @override
  MatchResultState? fromJson(Map<String, dynamic> json) =>
      MatchResultState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(MatchResultState state) => state.toMap();
}
