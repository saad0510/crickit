import '../../../core/extensions/text_ext.dart';

enum TeamPosition {
  captain,
  viceCaptain,
  member;

  int toMap() => index;

  static TeamPosition fromMap(dynamic data) => values[data as int];

  @override
  String toString() => name.removeCamelCase;

  bool get isPrivilged => this == captain;
}
