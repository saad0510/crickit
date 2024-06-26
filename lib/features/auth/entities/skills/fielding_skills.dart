class FieldingSkills {
  final int catching;
  final int groundFielding;
  final int throwing;

  const FieldingSkills({
    required this.catching,
    required this.groundFielding,
    required this.throwing,
  });

  const FieldingSkills.empty()
      : catching = 0,
        groundFielding = 0,
        throwing = 0;

  Map<String, dynamic> toMap() {
    return {
      'catching': catching,
      'groundFielding': groundFielding,
      'throwing': throwing,
    };
  }

  factory FieldingSkills.fromMap(dynamic data) {
    final map = Map<String, dynamic>.from(data);

    return FieldingSkills(
      catching: map['catching'],
      groundFielding: map['groundFielding'],
      throwing: map['throwing'],
    );
  }

  FieldingSkills copyWith({
    int? catching,
    int? groundFielding,
    int? throwing,
  }) {
    return FieldingSkills(
      catching: catching ?? this.catching,
      groundFielding: groundFielding ?? this.groundFielding,
      throwing: throwing ?? this.throwing,
    );
  }
}
