import 'enums/education_level.dart';

class Education {
  final String institute;
  final String position;
  final EducationLevel level;
  final DateTime startDate;
  final DateTime? endDate;

  const Education({
    required this.institute,
    required this.position,
    required this.level,
    required this.startDate,
    required this.endDate,
  });

  Education.empty()
      : institute = '',
        position = '',
        level = EducationLevel.none,
        startDate = DateTime(0),
        endDate = DateTime(0);

  Map<String, dynamic> toMap() {
    return {
      'institute': institute,
      'position': position,
      'level': level.toMap(),
      'start': startDate.millisecondsSinceEpoch,
      'end': endDate?.millisecondsSinceEpoch,
    };
  }

  factory Education.fromMap(dynamic data) {
    final map = Map<String, dynamic>.from(data);
    return Education(
      institute: map['institute'],
      position: map['position'],
      level: EducationLevel.fromMap(map['level']),
      startDate: DateTime.fromMillisecondsSinceEpoch(map['start']),
      endDate: map['end'] == null ? null : DateTime.fromMillisecondsSinceEpoch(map['end']),
    );
  }

  Education copyWith({
    String? institute,
    String? position,
    EducationLevel? level,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return Education(
      institute: institute ?? this.institute,
      position: position ?? this.position,
      level: level ?? this.level,
      startDate: startDate ?? this.startDate,
      endDate: endDate,
    );
  }
}
