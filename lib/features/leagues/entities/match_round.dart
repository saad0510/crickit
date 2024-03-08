import 'match_team.dart';
import 'match_type.dart';

class MatchRound {
  final String matchId;
  final String description;
  final String location;
  final DateTime scheduledAt;
  final List<MatchTeam> matchTeams;
  final MatchType type;

  const MatchRound({
    required this.matchId,
    required this.description,
    required this.location,
    required this.scheduledAt,
    required this.matchTeams,
    required this.type,
  });

  MatchRound copyWith({
    String? matchId,
    String? description,
    String? location,
    DateTime? scheduledAt,
    List<MatchTeam>? matchTeams,
    MatchType? type,
  }) {
    return MatchRound(
      matchId: matchId ?? this.matchId,
      description: description ?? this.description,
      location: location ?? this.location,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      matchTeams: matchTeams ?? this.matchTeams,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'matchId': matchId,
      'description': description,
      'location': location,
      'scheduledAt': scheduledAt.millisecondsSinceEpoch,
      'matchTeams': matchTeams.map((x) => x.toMap()).toList(),
      'type': type.toMap(),
    };
  }

  factory MatchRound.fromMap(dynamic data) {
    final map = Map<String, dynamic>.from(data);

    return MatchRound(
      matchId: map['matchId'] as String,
      description: map['description'] as String,
      location: map['location'] as String,
      scheduledAt: DateTime.fromMillisecondsSinceEpoch(map['scheduledAt'] as int),
      matchTeams: List.from(map['matchTeams'].map(MatchTeam.fromMap)),
      type: MatchType.fromMap(map['type']),
    );
  }
}
