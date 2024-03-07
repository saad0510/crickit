import '../../../../core/extensions/text_ext.dart';

enum BattingType {
  opener,
  topOrder,
  middleOrder,
  powerHitter,
  wicketKeeper;

  int toMap() => index;

  static BattingType fromMap(dynamic data) => values[data as int];

  @override
  String toString() => name.removeCamelCase;
}
