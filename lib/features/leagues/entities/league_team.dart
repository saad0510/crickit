class LeagueTeam {
  final String teamId;
  final DateTime joinedAt;

  const LeagueTeam({
    required this.teamId,
    required this.joinedAt,
  });

  LeagueTeam copyWith({
    String? teamId,
    DateTime? joinedAt,
  }) {
    return LeagueTeam(
      teamId: teamId ?? this.teamId,
      joinedAt: joinedAt ?? this.joinedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'teamId': teamId,
      'joinedAt': joinedAt.millisecondsSinceEpoch,
    };
  }

  factory LeagueTeam.fromMap(dynamic data) {
    final map = Map<String, dynamic>.from(data);

    return LeagueTeam(
      teamId: map['teamId'] as String,
      joinedAt: DateTime.fromMillisecondsSinceEpoch(map['joinedAt'] as int),
    );
  }
}
