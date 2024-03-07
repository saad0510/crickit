import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/routes.dart';
import '../../../app/sizer.dart';
import '../../../core/extensions/context_ext.dart';
import '../../home/widgets/app_logo.dart';
import '../controllers/current_user_provider.dart';

class UserScreenAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const UserScreenAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hideSensitive = ref.watch(hideSensitiveInfo);

    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 70.h,
      centerTitle: false,
      title: const AppLogo(),
      actions: [
        if (!hideSensitive)
          IconButton(
            tooltip: 'Settings',
            onPressed: () => context.push(AppRoutes.settings),
            icon: const Icon(Icons.settings),
          ),
        AppSizes.tinyX,
      ],
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 70.h);
}
