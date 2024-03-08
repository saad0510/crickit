import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../users/controllers/current_user_provider.dart';
import '../entities/skills/batting_skills.dart';
import '../widgets/rating_field.dart';

class BattingSkillsProfileScreen extends ConsumerWidget {
  const BattingSkillsProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skills = ref.watch(currentUserProvider).profile.skills.battingSkills;

    void update(BattingSkills newSkills) {
      final user = ref.read(currentUserProvider);
      final notifier = ref.read(currentUserProvider.notifier);
      notifier.state = user.copyWith(
        profile: user.profile.copyWith(
          skills: user.profile.skills.copyWith(battingSkills: newSkills),
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
            Text(
              'Batting Skills',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            AppSizes.normalY,
            RatingField(
              label: 'Batting',
              initial: skills.batting,
              onChanged: (x) => update(
                skills.copyWith(batting: x),
              ),
            ),
            AppSizes.smallY,
            RatingField(
              label: 'Technique',
              initial: skills.technique,
              onChanged: (x) => update(
                skills.copyWith(technique: x),
              ),
            ),
            AppSizes.smallY,
            RatingField(
              label: 'Shot Selection',
              initial: skills.shotSelection,
              onChanged: (x) => update(
                skills.copyWith(shotSelection: x),
              ),
            ),
            AppSizes.smallY,
            RatingField(
              label: 'Timing',
              initial: skills.timing,
              onChanged: (x) => update(
                skills.copyWith(timing: x),
              ),
            ),
            AppSizes.smallY,
            RatingField(
              label: 'Placement',
              initial: skills.placement,
              onChanged: (x) => update(
                skills.copyWith(placement: x),
              ),
            ),
            AppSizes.smallY,
            RatingField(
              label: 'Footwork',
              initial: skills.footwork,
              onChanged: (x) => update(
                skills.copyWith(footwork: x),
              ),
            ),
            AppSizes.smallY,
            RatingField(
              label: 'Power',
              initial: skills.power,
              onChanged: (x) => update(
                skills.copyWith(placement: x),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
