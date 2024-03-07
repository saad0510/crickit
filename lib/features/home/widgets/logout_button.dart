import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/loading/loading_text_button.dart';
import '../../auth/controllers/auth_notifier.dart';

class LogoutButton extends ConsumerWidget {
  const LogoutButton({super.key}) : short = false;

  const LogoutButton.short({super.key}) : short = true;

  final bool short;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (short) {
      return IconButton(
        onPressed: () => ref.read(authNotifier.notifier).logout(),
        tooltip: 'Logout',
        color: Theme.of(context).colorScheme.primary,
        icon: const Icon(Icons.logout),
      );
    }

    return LoadingTextButton(
      onPressed: ref.read(authNotifier.notifier).logout,
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.logout),
          Text(' Logout'),
        ],
      ),
    );
  }
}
