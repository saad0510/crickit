import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../users/controllers/current_user_provider.dart';
import '../entities/skills/batting_type.dart';
import '../entities/skills/bowling_type.dart';
import '../entities/skills/cricketer_skills.dart';
import '../entities/skills/cricketer_type.dart';
import '../widgets/app_drop_down_field.dart';
import '../widgets/rating_field.dart';

class CricketSkillsProfileScreen extends ConsumerWidget {
  const CricketSkillsProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skills = ref.watch(currentUserProvider).profile.skills;

    void update(CricketerSkills newSkills) {
      final user = ref.read(currentUserProvider);
      final notifier = ref.read(currentUserProvider.notifier);
      notifier.state = user.copyWith(
        profile: user.profile.copyWith(skills: newSkills),
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
              'Cricket Skills',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            AppSizes.largeY,
            AppSizes.tinyY,
            RatingField(
              label: 'Adaptability',
              initial: skills.adaptability,
              onChanged: (x) => update(
                skills.copyWith(adaptability: x),
              ),
            ),
            AppSizes.smallY,
            RatingField(
              label: 'Concentration',
              initial: skills.concentration,
              onChanged: (x) => update(
                skills.copyWith(concentration: x),
              ),
            ),
            AppSizes.smallY,
            RatingField(
              label: 'Communication',
              initial: skills.communication,
              onChanged: (x) => update(
                skills.copyWith(communication: x),
              ),
            ),
            AppSizes.largeY,
            AppDropDownField(
              label: 'Player Type',
              initial: skills.cricketerType,
              values: CricketerType.values,
              onSelected: (x) => update(
                skills.copyWith(cricketerType: x),
              ),
            ),
            AppSizes.normalY,
            AppDropDownField(
              label: 'Batting Type',
              initial: skills.battingType,
              values: BattingType.values,
              onSelected: (x) => update(
                skills.copyWith(battingType: x),
              ),
            ),
            AppSizes.normalY,
            AppDropDownField(
              label: 'Bowling Type',
              initial: skills.bowlingType,
              values: BowlingType.values,
              onSelected: (x) => update(
                skills.copyWith(bowlingType: x),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
