import '../../../core/extensions/text_ext.dart';

enum TeamRole {
  batsman,
  bowler,
  wicketKeeper,
  allRounder;

  int toMap() => index;

  static TeamRole fromMap(dynamic data) => values[data as int];

  @override
  String toString() => name.removeCamelCase;
}
