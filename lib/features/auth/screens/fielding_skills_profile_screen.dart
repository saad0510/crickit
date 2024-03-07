import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../users/controllers/current_user_provider.dart';
import '../entities/skills/fielding_skills.dart';
import '../widgets/main_title.dart';
import '../widgets/rating_field.dart';

class FieldingSkillsProfileScreen extends ConsumerWidget {
  const FieldingSkillsProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skills = ref.watch(currentUserProvider).profile.skills.fieldingSkills;

    void update(FieldingSkills newSkills) {
      final user = ref.read(currentUserProvider);
      final notifier = ref.read(currentUserProvider.notifier);
      notifier.state = user.copyWith(
        profile: user.profile.copyWith(
          skills: user.profile.skills.copyWith(fieldingSkills: newSkills),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: SingleChildScrollView(
        padding: AppPaddings.normal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const MainTitle('Fielding Skills'),
            AppSizes.normalY,
            RatingField(
              label: 'Catching',
              initial: skills.catching,
              onChanged: (x) => update(
                skills.copyWith(catching: x),
              ),
            ),
            AppSizes.smallY,
            RatingField(
              label: 'Ground Fielding',
              initial: skills.groundFielding,
              onChanged: (x) => update(
                skills.copyWith(groundFielding: x),
              ),
            ),
            AppSizes.smallY,
            RatingField(
              label: 'Throwing',
              initial: skills.throwing,
              onChanged: (x) => update(
                skills.copyWith(throwing: x),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
