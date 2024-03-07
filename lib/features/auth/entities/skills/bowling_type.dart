import '../../../../core/extensions/text_ext.dart';

enum BowlingType {
  fastBowler,
  spinBowler,
  allRounder;

  int toMap() => index;

  static BowlingType fromMap(dynamic data) => values[data as int];

  @override
  String toString() => name.removeCamelCase;
}
