import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/loading/loading_list.dart';
import '../../users/controllers/override_widget.dart';
import '../controllers/current_league_provider.dart';
import '../controllers/leagues_provider.dart';
import 'league_tile.dart';

class AvailableLeaguesList extends ConsumerWidget {
  const AvailableLeaguesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LoadingList.neverScroll(
      value: ref.watch(availableleaguesProvider),
      emptyMessage: 'No leagues available',
      builder: (league, i) {
        return OverrideWidget(
          key: ValueKey(league),
          userId: league.createdBy,
          moreOverrides: [
            currentLeagueProvider.overrideWith((_) => league),
          ],
          child: const LeagueTile(),
        );
      },
    );
  }
}
