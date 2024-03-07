import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../controllers/current_user_provider.dart';
import '../widgets/cards/about_user_card.dart';
import '../widgets/cards/contact_card.dart';
import '../widgets/cards/education_card.dart';
import '../widgets/cards/residence_card.dart';
import '../widgets/user_bio_text.dart';
import '../widgets/user_screen_app_bar.dart';
import '../widgets/user_summary.dart';

class UserDetailScreen extends ConsumerWidget {
  const UserDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final hideSensitive = ref.watch(hideSensitiveInfo);

    return Scaffold(
      appBar: const UserScreenAppBar(),
      body: SingleChildScrollView(
        padding: AppPaddings.normal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            UserSummary(user),
            const UserBioText(),
            AppSizes.normalY,
            AboutUserCard(user),
            AppSizes.smallY,
            if (!hideSensitive) ...[
              ContactCard(user),
              AppSizes.smallY,
            ],
            ResidenceCard(user),
            AppSizes.smallY,
            EducationCard(user),
            AppSizes.smallY,
            if (hideSensitive) ...[
              AppSizes.largeY,
              AppSizes.largeY,
            ],
          ],
        ),
      ),
    );
  }
}
