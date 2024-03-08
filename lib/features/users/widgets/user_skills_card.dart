import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../controllers/current_user_provider.dart';
import '../screens/animating_progress_bar.dart';

class UserSkillsCard extends ConsumerWidget {
  const UserSkillsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _RatingDisplay(
          rating: user.profile.skills.battingSkills.average,
          title: 'Batting',
        ),
        AppSizes.smallY,
        _RatingDisplay(
          rating: user.profile.skills.bowlingSkills.average,
          title: 'Bowling',
        ),
        AppSizes.smallY,
        _RatingDisplay(
          rating: user.profile.skills.fieldingSkills.average,
          title: 'Fielding',
        ),
      ],
    );
  }
}

class _RatingDisplay extends StatelessWidget {
  const _RatingDisplay({
    required this.rating,
    required this.title,
  });

  final double rating;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(title),
            ),
            const Icon(
              Icons.star_rounded,
              color: Colors.amber,
            ),
            Text(
              rating.toStringAsFixed(2),
            )
          ],
        ),
        AppSizes.tinyY,
        AnimatingProgressBar(rating / 5),
      ],
    );
  }
}
