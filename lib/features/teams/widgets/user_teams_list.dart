import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/loading/loading_list.dart';
import '../../users/controllers/override_widget.dart';
import '../controllers/current_team_provider.dart';
import '../controllers/teams_provider.dart';
import 'team_tile.dart';

class UserTeamsList extends ConsumerWidget {
  const UserTeamsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LoadingList.neverScroll(
      value: ref.watch(userTeamsProvider),
      emptyMessage: 'No teams available',
      builder: (team, i) {
        return OverrideWidget(
          key: ValueKey(team),
          userId: team.createdBy,
          moreOverrides: [
            currentTeamProvider.overrideWithValue(team),
          ],
          child: const TeamTile(),
        );
      },
    );
  }
}
