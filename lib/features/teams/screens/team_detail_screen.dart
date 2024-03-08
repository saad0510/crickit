import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../../core/extensions/context_ext.dart';
import '../../users/controllers/override_widget.dart';
import '../controllers/current_team_member_provider.dart';
import '../controllers/current_team_notifier.dart';
import '../controllers/current_team_provider.dart';
import '../widgets/join_team_button.dart';
import '../widgets/team_constraints_card.dart';
import '../widgets/team_member_tile.dart';
import 'batting_order_screen.dart';
import 'bowling_order_screen.dart';
import 'create_team_screen.dart';
import 'select_members_screen.dart';

class TeamDetailScreen extends ConsumerWidget {
  const TeamDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final team = ref.watch(currentTeamNotifier).copyWith();
    final notifier = ref.read(currentTeamNotifier.notifier);

    final allowChange = notifier.isCaptain;
    team.members.sort();

    final titleStyle = Theme.of(context).textTheme.titleSmall;

    void newScreen(Widget screen) {
      context.pushScreen(
        screen,
        overrides: [
          currentTeamProvider.overrideWith((_) => team.copyWith()),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(team.title),
        actions: [
          if (allowChange)
            TextButton(
              onPressed: () => newScreen(CreateTeamScreen(editWith: team)),
              child: const Text('Edit'),
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: AppPaddings.normal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(team.description),
            AppSizes.normalY,
            if (allowChange) ...[
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${team.members.length} members',
                      style: titleStyle,
                    ),
                  ),
                  TextButton(
                    onPressed: () => newScreen(const SelectMembersScreen()),
                    child: const Text('Select'),
                  ),
                ],
              ),
            ],
            AppSizes.smallY,
            for (final member in team.members) ...[
              OverrideWidget(
                key: ValueKey(member),
                userId: member.uid,
                moreOverrides: [
                  currentTeamMemberProvider.overrideWithValue(member),
                ],
                child: const TeamMemberTile(),
              ),
              AppSizes.normalY,
            ],
            const TeamConstraintsCard(),
            AppSizes.normalY,
            AppSizes.smallY,
            ListTile(
              tileColor: Colors.grey.shade100,
              visualDensity: VisualDensity.compact,
              onTap: () => newScreen(const BattingOrderScreen()),
              title: const Text('Batting Order'),
              trailing: const Icon(Icons.keyboard_arrow_right_rounded),
            ),
            AppSizes.tinyY,
            ListTile(
              tileColor: Colors.grey.shade100,
              visualDensity: VisualDensity.compact,
              onTap: () => newScreen(const BowlingOrderScreen()),
              title: const Text('Bowling Lineup'),
              trailing: const Icon(Icons.keyboard_arrow_right_rounded),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const JoinTeamButton(),
    );
  }
}
