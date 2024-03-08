import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../controllers/current_team_provider.dart';
import '../entities/team_role.dart';
import 'team_constraint_row.dart';

class TeamConstraintsCard extends ConsumerWidget {
  const TeamConstraintsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final team = ref.watch(currentTeamProvider);
    final batsmen = team.membersByRole(TeamRole.batsman);
    final validBatsmen = batsmen.length <= team.constraints.maxBatsmen;
    final bowlers = team.membersByRole(TeamRole.bowler);
    final validBowlers = bowlers.length <= team.constraints.maxBowlers;
    final keepers = team.membersByRole(TeamRole.wicketKeeper);
    final validKeepers = keepers.length <= team.constraints.maxWicketKeepers;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppSizes.tinyY,
        TeamConstraintRow(
          active: validBatsmen,
          label: '${batsmen.length}/${team.constraints.maxBatsmen} batsmen',
        ),
        AppSizes.tinyY,
        TeamConstraintRow(
          active: validBowlers,
          label: '${bowlers.length}/${team.constraints.maxBowlers} bowlers',
        ),
        AppSizes.tinyY,
        TeamConstraintRow(
          active: validKeepers,
          label: '${keepers.length}/${team.constraints.maxWicketKeepers} wicket keepers',
        ),
      ],
    );
  }
}
