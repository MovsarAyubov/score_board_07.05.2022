// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TeamNameState {
  final String homeBoardName;
  final String guestBoardName;
  TeamNameState({
    this.homeBoardName = "Home",
    this.guestBoardName = "Guest",
  });

  TeamNameState copyWith({
    String? homeBoardName,
    String? guestBoardName,
  }) {
    return TeamNameState(
      homeBoardName: homeBoardName ?? this.homeBoardName,
      guestBoardName: guestBoardName ?? this.guestBoardName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'homeBoardName': homeBoardName,
      'guestBoardName': guestBoardName,
    };
  }

  factory TeamNameState.fromMap(Map<String, dynamic> map) {
    return TeamNameState(
      homeBoardName: map['homeBoardName'] as String,
      guestBoardName: map['guestBoardName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TeamNameState.fromJson(String source) =>
      TeamNameState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TeamNameState(homeBoardName: $homeBoardName, guestBoardName: $guestBoardName)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TeamNameState &&
        other.homeBoardName == homeBoardName &&
        other.guestBoardName == guestBoardName;
  }

  @override
  int get hashCode => homeBoardName.hashCode ^ guestBoardName.hashCode;
}
