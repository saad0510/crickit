import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../users/screens/user_detail_screen.dart';
import '../entities/nav_item.dart';
import '../screens/home_screen.dart';

class NavigationNotifier extends AutoDisposeNotifier<NavItem> {
  final screens = {
    NavItem.home: const HomeScreen(),
    NavItem.profile: const UserDetailScreen(),
  };

  @override
  NavItem build() => NavItem.home;

  void newScreen(NavItem item) => state = item;

  Widget get currentScreen => screens[state]!;

  void maybePop(BuildContext context) {
    final nav = Navigator.of(context);
    nav.canPop() ? nav.pop() : newScreen(NavItem.home);
  }
}

final navigationProvider = NotifierProvider.autoDispose<NavigationNotifier, NavItem>(
  NavigationNotifier.new,
  name: 'navigator',
);
