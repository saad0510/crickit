import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../users/controllers/current_user_provider.dart';
import '../entities/skills/bowling_skills.dart';
import '../widgets/main_title.dart';
import '../widgets/rating_field.dart';

class BowlingSkillsProfileScreen extends ConsumerWidget {
  const BowlingSkillsProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skills = ref.watch(currentUserProvider).profile.skills.bowlingSkills;

    void update(BowlingSkills newSkills) {
      final user = ref.read(currentUserProvider);
      final notifier = ref.read(currentUserProvider.notifier);
      notifier.state = user.copyWith(
        profile: user.profile.copyWith(
          skills: user.profile.skills.copyWith(bowlingSkills: newSkills),
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
            const MainTitle('Bowling Skills'),
            AppSizes.normalY,
            RatingField(
              label: 'Swing',
              initial: skills.swing,
              onChanged: (x) => update(
                skills.copyWith(swing: x),
              ),
            ),
            AppSizes.smallY,
            RatingField(
              label: 'Spin Control',
              initial: skills.spinControl,
              onChanged: (x) => update(
                skills.copyWith(spinControl: x),
              ),
            ),
            AppSizes.smallY,
            RatingField(
              label: 'Pace',
              initial: skills.pace,
              onChanged: (x) => update(
                skills.copyWith(pace: x),
              ),
            ),
            AppSizes.smallY,
            RatingField(
              label: 'Accuracy',
              initial: skills.accuracy,
              onChanged: (x) => update(
                skills.copyWith(accuracy: x),
              ),
            ),
            AppSizes.smallY,
            RatingField(
              label: 'Wicket Taking',
              initial: skills.wicketTaking,
              onChanged: (x) => update(
                skills.copyWith(wicketTaking: x),
              ),
            ),
            AppSizes.smallY,
            RatingField(
              label: 'Line Length',
              initial: skills.lineLength,
              onChanged: (x) => update(
                skills.copyWith(lineLength: x),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
