import 'package:flutter/material.dart';

import '../../../core/extensions/text_ext.dart';

enum NavItem {
  home(Icons.home_outlined, Icons.home),
  team(Icons.group_outlined, Icons.group),
  profile(Icons.person_outline_rounded, Icons.person_rounded),
  settings(Icons.settings_outlined, Icons.settings_rounded),
  ;

  final IconData icon;
  final IconData selectedIcon;

  const NavItem(this.icon, this.selectedIcon);

  String get label => name.capitalize();
}
