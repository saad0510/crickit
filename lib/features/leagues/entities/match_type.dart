import '../../../../core/extensions/text_ext.dart';

enum MatchType {
  t20,
  oneDay,
  testMatch;

  int toMap() => index;

  static MatchType fromMap(dynamic data) => values[data as int];

  @override
  String toString() => name.removeCamelCase;
}
