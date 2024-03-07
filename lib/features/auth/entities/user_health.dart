class UserHealth {
  final bool smoking;
  final double height;
  final double weight;

  const UserHealth({
    required this.smoking,
    required this.height,
    required this.weight,
  });

  const UserHealth.empty()
      : smoking = false,
        height = -1,
        weight = -1;

  UserHealth copyWith({
    bool? smoking,
    double? height,
    double? weight,
  }) {
    return UserHealth(
      smoking: smoking ?? this.smoking,
      height: height ?? this.height,
      weight: weight ?? this.weight,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'smoking': smoking,
      'height': height,
      'weight': weight,
    };
  }

  factory UserHealth.fromMap(Map<String, dynamic> map) {
    return UserHealth(
      height: (map['height'] as num).toDouble(),
      weight: (map['weight'] as num).toDouble(),
      smoking: map['smoking'],
    );
  }
}
