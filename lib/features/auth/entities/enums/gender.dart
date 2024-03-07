import 'package:flutter/material.dart';

import '../../../../core/extensions/text_ext.dart';

enum Gender {
  male(Icons.male),
  female(Icons.female);

  final IconData icon;

  const Gender(this.icon);

  @override
  String toString() => name.capitalize();

  int toMap() => index;

  static Gender fromMap(dynamic data) => values[data as int];
}
