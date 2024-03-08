import 'league_team.dart';
import 'match_round.dart';

class League {
  final String id;
  final String title;
  final String description;
  final String createdBy;
  final DateTime createdAt;
  final int maxMatches;
  final int maxTeams;
  final List<LeagueTeam> teams;
  final List<MatchRound> matches;

  const League({
    required this.id,
    required this.title,
    required this.description,
    required this.createdBy,
    required this.createdAt,
    required this.maxMatches,
    required this.maxTeams,
    required this.teams,
    required this.matches,
  });

  bool get fullMatches => matches.length <= maxTeams;
  bool get fullTeams => teams.length <= maxTeams;

  bool get isAvailable => teams.length < maxTeams;

  League copyWith({
    String? id,
    String? title,
    String? description,
    String? createdBy,
    DateTime? createdAt,
    int? maxMatches,
    int? maxTeams,
    List<LeagueTeam>? teams,
    List<MatchRound>? matches,
  }) {
    return League(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      maxMatches: maxMatches ?? this.maxMatches,
      maxTeams: maxTeams ?? this.maxTeams,
      teams: teams ?? this.teams,
      matches: matches ?? this.matches,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'createdBy': createdBy,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'maxMatches': maxMatches,
      'maxTeams': maxTeams,
      'teams': teams.map((x) => x.toMap()).toList(),
      'matches': matches.map((x) => x.toMap()).toList(),
    };
  }

  factory League.fromMap(dynamic data) {
    final map = Map<String, dynamic>.from(data);

    return League(
      id: map['id'],
      title: map['title'] as String,
      description: map['description'] as String,
      createdBy: map['createdBy'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      maxMatches: map['maxMatches'] as int,
      maxTeams: map['maxTeams'] as int,
      teams: List.from(
        map['teams'].map(LeagueTeam.fromMap),
      ),
      matches: List.from(
        map['matches'].map(MatchRound.fromMap),
      ),
    );
  }
}
