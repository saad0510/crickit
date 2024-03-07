import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../../app/theme/ui_overlays.dart';
import '../controllers/navigation_notifier.dart';
import '../entities/nav_item.dart';

class NavigationScreen extends ConsumerWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = List.from(NavItem.values);

    final currentItem = ref.watch(navigationProvider);
    final index = items.indexOf(currentItem);
    final navNotifier = ref.read(navigationProvider.notifier);

    return PopScope(
      canPop: index == 0,
      onPopInvoked: (_) => ref.read(navigationProvider.notifier).maybePop(context),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          systemOverlayStyle: AppUiOverlays.lightOverlay.copyWith(
            systemNavigationBarColor: Theme.of(context).colorScheme.onInverseSurface,
          ),
        ),
        body: navNotifier.currentScreen,
        bottomNavigationBar: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (i) => navNotifier.newScreen(items[i]),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: List.generate(
            items.length,
            (i) {
              final item = items[i];
              Widget icon = Icon(item.icon, size: 30.sp);
              Widget selectedIcon = Icon(item.selectedIcon, size: 25.sp);

              return NavigationDestination(
                label: item.label,
                icon: icon,
                selectedIcon: selectedIcon,
              );
            },
          ),
        ),
      ),
    );
  }
}
