import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../controllers/current_user_provider.dart';

class UserBioText extends ConsumerWidget {
  const UserBioText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bio = ref.watch(currentUserProvider.select((u) => u.profile.bio));

    if (bio.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppSizes.normalY,
        Text(
          'About Me',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        AppSizes.tinyY,
        Text(bio),
      ],
    );
  }
}
