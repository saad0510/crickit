extension FormatExt on String {
  String capitalize() => this[0].toUpperCase() + substring(1);

  String get removeCamelCase {
    return replaceAllMapped(
      RegExp(r'^([a-z])|[A-Z]'),
      (Match m) => m[1] == null ? " ${m[0]}" : m[1]!.toUpperCase(),
    );
  }
}
