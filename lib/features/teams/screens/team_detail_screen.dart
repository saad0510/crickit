import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../../core/extensions/context_ext.dart';
import '../../users/controllers/override_widget.dart';
import '../controllers/current_team_member_provider.dart';
import '../controllers/current_team_provider.dart';
import '../widgets/team_member_tile.dart';
import 'batting_order_screen.dart';
import 'bowling_order_screen.dart';
import 'select_members_screen.dart';

class TeamDetailScreen extends ConsumerWidget {
  const TeamDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final team = ref.watch(currentTeamProvider).copyWith();
    team.members.sort();

    final titleStyle = Theme.of(context).textTheme.titleSmall;

    return Scaffold(
      appBar: AppBar(
        title: Text(team.title),
      ),
      body: SingleChildScrollView(
        padding: AppPaddings.normal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(team.description),
            AppSizes.smallY,
            TextButton(
              onPressed: () => context.pushScreen(const BattingOrderScreen()),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text('Batting Order'),
              ),
            ),
            TextButton(
              onPressed: () => context.pushScreen(const BowlingOrderScreen()),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text('Bowling Lineup'),
              ),
            ),
            AppSizes.normalY,
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${team.members.length} members',
                    style: titleStyle,
                  ),
                ),
                TextButton(
                  onPressed: () => context.pushScreen(const SelectMembersScreen()),
                  child: const Text('Edit'),
                ),
              ],
            ),
            for (final member in team.members) ...[
              AppSizes.smallY,
              OverrideWidget(
                key: ValueKey(member),
                userId: member.uid,
                moreOverrides: [
                  currentTeamMemberProvider.overrideWith((_) => member),
                ],
                child: const TeamMemberTile(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
