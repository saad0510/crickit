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

  const TeamConstraints.initial()
      : maxPlayers = 2,
        maxBatsmen = 2,
        maxBowlers = 2,
        maxWicketKeepers = 2;

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
