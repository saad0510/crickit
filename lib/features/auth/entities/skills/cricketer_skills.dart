import 'batting_skills.dart';
import 'batting_type.dart';
import 'bowling_skills.dart';
import 'bowling_type.dart';
import 'cricketer_type.dart';
import 'fielding_skills.dart';

class CricketerSkills {
  final int adaptability;
  final int concentration;
  final int communication;

  final CricketerType cricketerType;
  final BattingType battingType;
  final BowlingType bowlingType;

  final FieldingSkills fieldingSkills;
  final BowlingSkills bowlingSkills;
  final BattingSkills battingSkills;

  const CricketerSkills({
    required this.adaptability,
    required this.concentration,
    required this.communication,
    required this.cricketerType,
    required this.battingType,
    required this.bowlingType,
    required this.fieldingSkills,
    required this.bowlingSkills,
    required this.battingSkills,
  });

  const CricketerSkills.empty()
      : adaptability = 0,
        concentration = 0,
        communication = 0,
        cricketerType = CricketerType.batsman,
        battingType = BattingType.powerHitter,
        bowlingType = BowlingType.allRounder,
        fieldingSkills = const FieldingSkills.empty(),
        bowlingSkills = const BowlingSkills.empty(),
        battingSkills = const BattingSkills.empty();

  String get playerType {
    return switch (cricketerType) {
      CricketerType.batsman => '$battingType',
      CricketerType.bowler => '$bowlingType',
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'adaptability': adaptability,
      'concentration': concentration,
      'communication': communication,
      'cricketerType': cricketerType.toMap(),
      'battingType': battingType.toMap(),
      'bowlingType': bowlingType.toMap(),
      'fieldingSkills': fieldingSkills.toMap(),
      'bowlingSkills': bowlingSkills.toMap(),
      'battingSkills': battingSkills.toMap(),
    };
  }

  factory CricketerSkills.fromMap(dynamic data) {
    final map = Map<String, dynamic>.from(data);

    return CricketerSkills(
      adaptability: map['adaptability'],
      concentration: map['concentration'],
      communication: map['communication'],
      cricketerType: CricketerType.fromMap(map['cricketerType']),
      battingType: BattingType.fromMap(map['battingType']),
      bowlingType: BowlingType.fromMap(map['bowlingType']),
      fieldingSkills: FieldingSkills.fromMap(map['fieldingSkills']),
      bowlingSkills: BowlingSkills.fromMap(map['bowlingSkills']),
      battingSkills: BattingSkills.fromMap(map['battingSkills']),
    );
  }

  CricketerSkills copyWith({
    int? adaptability,
    int? concentration,
    int? communication,
    CricketerType? cricketerType,
    BattingType? battingType,
    BowlingType? bowlingType,
    FieldingSkills? fieldingSkills,
    BowlingSkills? bowlingSkills,
    BattingSkills? battingSkills,
  }) {
    return CricketerSkills(
      adaptability: adaptability ?? this.adaptability,
      concentration: concentration ?? this.concentration,
      communication: communication ?? this.communication,
      cricketerType: cricketerType ?? this.cricketerType,
      battingType: battingType ?? this.battingType,
      bowlingType: bowlingType ?? this.bowlingType,
      fieldingSkills: fieldingSkills ?? this.fieldingSkills,
      bowlingSkills: bowlingSkills ?? this.bowlingSkills,
      battingSkills: battingSkills ?? this.battingSkills,
    );
  }
}
