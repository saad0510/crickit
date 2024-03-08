import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/loading/shimmer_tile.dart';
import '../../auth/entities/user_data.dart';
import '../../teams/controllers/current_team_provider.dart';
import '../../teams/entities/team.dart';
import 'current_user_provider.dart';
import 'fetch_user_provider.dart';

class OverrideWidget extends ConsumerWidget {
  const OverrideWidget({
    super.key,
    this.userId,
    this.teamId,
    required this.child,
    this.moreOverrides = const [],
    this.parent,
  });

  final String? userId;
  final String? teamId;
  final Widget child;
  final List<Override> moreOverrides;
  final ProviderContainer? parent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final futures = [
      if (userId != null) ref.watch(fetchUserProvider(userId!).future),
      if (teamId != null) ref.watch(fetchTeamProvider(teamId!).future),
    ];

    return FutureBuilder(
      future: Future.wait(futures),
      builder: (context, snap) {
        final user = snap.data?.whereType<UserData>().singleOrNull;
        final team = snap.data?.whereType<Team>().singleOrNull;
        if (userId != null && user == null) return const ShimmerTile();
        if (teamId != null && team == null) return const ShimmerTile();

        final overrides = [
          if (user != null) currentUserProvider.overrideWith((_) => user),
          if (team != null) currentTeamProvider.overrideWith((_) => team),
          ...moreOverrides,
        ];

        return ProviderScope(
          overrides: overrides,
          parent: parent,
          child: child,
        );
      },
    );
  }
}
