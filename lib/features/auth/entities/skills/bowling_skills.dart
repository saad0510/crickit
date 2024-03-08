import 'i_skills.dart';

class BowlingSkills extends ISKills {
  final int lineLength;
  final int swing;
  final int spinControl;
  final int pace;
  final int accuracy;
  final int wicketTaking;

  BowlingSkills({
    required this.lineLength,
    required this.swing,
    required this.spinControl,
    required this.pace,
    required this.accuracy,
    required this.wicketTaking,
  });

  BowlingSkills.empty()
      : lineLength = 0,
        swing = 0,
        spinControl = 0,
        pace = 0,
        accuracy = 0,
        wicketTaking = 0;

  Map<String, dynamic> toMap() {
    return {
      'lineLength': lineLength,
      'swing': swing,
      'spinControl': spinControl,
      'pace': pace,
      'accuracy': accuracy,
      'wicketTaking': wicketTaking,
    };
  }

  factory BowlingSkills.fromMap(dynamic data) {
    final map = Map<String, dynamic>.from(data);

    return BowlingSkills(
      lineLength: map['lineLength'],
      swing: map['swing'],
      spinControl: map['spinControl'],
      pace: map['pace'],
      accuracy: map['accuracy'],
      wicketTaking: map['wicketTaking'],
    );
  }

  BowlingSkills copyWith({
    int? lineLength,
    int? swing,
    int? spinControl,
    int? pace,
    int? accuracy,
    int? wicketTaking,
  }) {
    return BowlingSkills(
      lineLength: lineLength ?? this.lineLength,
      swing: swing ?? this.swing,
      spinControl: spinControl ?? this.spinControl,
      pace: pace ?? this.pace,
      accuracy: accuracy ?? this.accuracy,
      wicketTaking: wicketTaking ?? this.wicketTaking,
    );
  }

  @override
  List<int> get values => [
        lineLength,
        swing,
        spinControl,
        pace,
        accuracy,
        wicketTaking,
      ];
}
