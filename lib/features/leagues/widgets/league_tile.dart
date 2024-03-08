import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/extensions/context_ext.dart';
import '../controllers/current_league_provider.dart';
import '../screens/league_detail_screen.dart';

class LeagueTile extends ConsumerWidget {
  const LeagueTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final league = ref.watch(currentLeagueProvider);

    final foreground = Theme.of(context).colorScheme.primary;

    return Material(
      elevation: 2,
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: ListTile(
        onTap: () => context.pushScreen(const LeagueDetailScreen()),
        title: Text(league.title),
        subtitle: Text(
          league.description,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Text(
          '${league.teams.length} / ${league.maxMatches}',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(color: foreground),
        ),
      ),
    );
  }
}
