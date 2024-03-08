import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../../core/extensions/context_ext.dart';
import '../../auth/controllers/user_provider.dart';
import '../../leagues/screens/create_league_screen.dart';
import '../../teams/widgets/team_constraint_row.dart';
import '../../teams/widgets/team_tile.dart';
import '../../users/controllers/override_widget.dart';
import '../controllers/current_league_provider.dart';

class LeagueDetailScreen extends ConsumerWidget {
  const LeagueDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final league = ref.watch(currentLeagueProvider).copyWith();
    final titleStyle = Theme.of(context).textTheme.titleSmall;

    final allowChange = ref.watch(userIdProvider) == league.createdBy;

    void newScreen(Widget screen) {
      context.pushScreen(screen);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(league.title),
        actions: [
          if (allowChange)
            TextButton(
              onPressed: () => newScreen(CreateLeagueScreen(editWith: league)),
              child: const Text('Edit'),
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: AppPaddings.normal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(league.description),
            AppSizes.normalY,
            TeamConstraintRow(
              label: '${league.matches.length}/${league.maxMatches}  matches',
              active: league.fullMatches,
            ),
            AppSizes.tinyY,
            TeamConstraintRow(
              label: '${league.teams.length}/${league.maxTeams} teams',
              active: league.fullMatches,
            ),
            AppSizes.normalY,
            if (allowChange) ...[
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${league.teams.length} teams',
                      style: titleStyle,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Select'),
                  ),
                ],
              ),
            ],
            AppSizes.smallY,
            for (final team in league.teams) ...[
              OverrideWidget(
                key: ValueKey(team),
                teamId: team.teamId,
                child: const TeamTile(),
              ),
              AppSizes.normalY,
            ],
            AppSizes.largeY,
            AppSizes.largeY,
          ],
        ),
      ),
    );
  }
}
