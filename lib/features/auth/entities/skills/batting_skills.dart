import 'i_skills.dart';

class BattingSkills extends ISKills {
  final int batting;
  final int technique;
  final int shotSelection;
  final int timing;
  final int placement;
  final int footwork;
  final int power;

  BattingSkills({
    required this.batting,
    required this.technique,
    required this.shotSelection,
    required this.timing,
    required this.placement,
    required this.footwork,
    required this.power,
  });

  BattingSkills.empty()
      : batting = 0,
        technique = 0,
        shotSelection = 0,
        timing = 0,
        placement = 0,
        footwork = 0,
        power = 0;

  Map<String, dynamic> toMap() {
    return {
      'batting': batting,
      'technique': technique,
      'shotSelection': shotSelection,
      'timing': timing,
      'placement': placement,
      'footwork': footwork,
      'power': power,
    };
  }

  factory BattingSkills.fromMap(dynamic data) {
    final map = Map<String, dynamic>.from(data);

    return BattingSkills(
      batting: map['batting'],
      technique: map['technique'],
      shotSelection: map['shotSelection'],
      timing: map['timing'],
      placement: map['placement'],
      footwork: map['footwork'],
      power: map['power'],
    );
  }

  BattingSkills copyWith({
    int? batting,
    int? technique,
    int? shotSelection,
    int? timing,
    int? placement,
    int? footwork,
    int? power,
  }) {
    return BattingSkills(
      batting: batting ?? this.batting,
      technique: technique ?? this.technique,
      shotSelection: shotSelection ?? this.shotSelection,
      timing: timing ?? this.timing,
      placement: placement ?? this.placement,
      footwork: footwork ?? this.footwork,
      power: power ?? this.power,
    );
  }

  @override
  List<int> get values => [
        batting,
        technique,
        shotSelection,
        timing,
        placement,
        footwork,
        power,
      ];
}
