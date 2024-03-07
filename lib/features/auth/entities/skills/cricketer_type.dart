import '../../../../core/extensions/text_ext.dart';

enum CricketerType {
  batsman,
  bowler;

  int toMap() => index;

  static CricketerType fromMap(dynamic data) => values[data as int];

  @override
  String toString() => name.removeCamelCase;
}
