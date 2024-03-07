import 'package:flutter/material.dart';

import '../../../core/extensions/text_ext.dart';

enum NavItem {
  home(Icons.home_outlined, Icons.home),
  profile(Icons.person_outline_rounded, Icons.person_rounded),
  ;

  final IconData icon;
  final IconData selectedIcon;

  const NavItem(this.icon, this.selectedIcon);

  String get label => name.capitalize();
}
