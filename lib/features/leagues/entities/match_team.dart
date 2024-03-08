class MatchTeam {
  final String teamId;

  const MatchTeam({
    required this.teamId,
  });

  MatchTeam copyWith({
    String? teamId,
  }) {
    return MatchTeam(
      teamId: teamId ?? this.teamId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'teamId': teamId,
    };
  }

  factory MatchTeam.fromMap(dynamic data) {
    final map = Map<String, dynamic>.from(data);

    return MatchTeam(
      teamId: map['teamId'] as String,
    );
  }
}
