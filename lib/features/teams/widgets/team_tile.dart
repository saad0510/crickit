import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/extensions/context_ext.dart';
import '../controllers/current_team_provider.dart';
import '../screens/team_detail_screen.dart';

class TeamTile extends ConsumerWidget {
  const TeamTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final team = ref.watch(currentTeamProvider);

    return ListTile(
      onTap: () => context.pushScreen(const TeamDetailScreen()),
      title: Text(team.title),
      subtitle: Text(
        team.description,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        child: Text(
          '${team.members.length}',
        ),
      ),
    );
  }
}
