import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:score_board/cubit/scoreboard_team_name/team_name_state.dart';

class TeamNameCubit extends Cubit<TeamNameState> {
  TeamNameCubit() : super(TeamNameState());

  final teamNameState = TeamNameState();

  setGuestBoardName(String guestBoardName) {
    emit(state.copyWith(guestBoardName: guestBoardName));
  }

  setHomeBoardName(String homeBoardName) {
    emit(state.copyWith(homeBoardName: homeBoardName));
  }
}
