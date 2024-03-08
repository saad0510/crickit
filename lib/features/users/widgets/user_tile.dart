import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../../core/extensions/context_ext.dart';
import '../controllers/current_user_provider.dart';
import '../screens/other_user_detail_screen.dart';
import 'user_image.dart';

class UserTile extends ConsumerWidget {
  const UserTile({super.key, this.trailing});

  final Widget? trailing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);

    return ListTile(
      key: ValueKey(user),
      contentPadding: AppPaddings.tinyX,
      tileColor: Colors.grey.shade100,
      onTap: () {
        context.pushScreen(
          const OtherUserDetailScreen(),
        );
      },
      leading: UserImage(
        user.detail.imageUrl,
        radius: 55,
        userId: user.uid,
      ),
      title: Text(
        user.detail.name,
      ),
      subtitle: Text(
        user.detail.email,
      ),
      trailing: trailing,
    );
  }
}
