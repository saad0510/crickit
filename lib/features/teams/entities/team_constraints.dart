class TeamConstraints {
  final int maxPlayers;
  final int maxBatsmen;
  final int maxBowlers;
  final int maxWicketKeepers;

  const TeamConstraints({
    required this.maxPlayers,
    required this.maxBatsmen,
    required this.maxBowlers,
    required this.maxWicketKeepers,
  });

  const TeamConstraints.zero()
      : maxPlayers = 0,
        maxBatsmen = 0,
        maxBowlers = 0,
        maxWicketKeepers = 0;

  Map<String, dynamic> toMap() {
    return {
      'players': maxPlayers,
      'batsmen': maxBatsmen,
      'bowlers': maxBowlers,
      'keepers': maxWicketKeepers,
    };
  }

  factory TeamConstraints.fromMap(dynamic data) {
    final map = Map<String, dynamic>.from(data);

    return TeamConstraints(
      maxPlayers: map['players'],
      maxBatsmen: map['batsmen'],
      maxBowlers: map['bowlers'],
      maxWicketKeepers: map['keepers'],
    );
  }

  TeamConstraints copyWith({
    int? maxPlayers,
    int? maxBatsmen,
    int? maxBowlers,
    int? maxWicketKeepers,
  }) {
    return TeamConstraints(
      maxPlayers: maxPlayers ?? this.maxPlayers,
      maxBatsmen: maxBatsmen ?? this.maxBatsmen,
      maxBowlers: maxBowlers ?? this.maxBowlers,
      maxWicketKeepers: maxWicketKeepers ?? this.maxWicketKeepers,
    );
  }
}
