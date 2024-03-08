import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../auth/controllers/user_provider.dart';
import '../../users/widgets/user_image.dart';
import 'notification_button.dart';

class HomeAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return Padding(
      padding: AppPaddings.normal.copyWith(right: 0, bottom: 0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        leading: UserImage(user.detail.imageUrl),
        centerTitle: false,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Hello!',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
            Text(
              user.detail.name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        actions: const [
          Center(
            widthFactor: 2,
            child: NotificationButton(),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 80.h);
}
