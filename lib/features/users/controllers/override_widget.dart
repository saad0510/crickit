import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/loading/shimmer_tile.dart';
import '../../auth/entities/user_data.dart';
import 'current_user_provider.dart';
import 'fetch_user_provider.dart';

class OverrideWidget extends ConsumerWidget {
  const OverrideWidget({
    super.key,
    this.userId,
    required this.child,
    this.moreOverrides = const [],
    this.parent,
  });

  final String? userId;
  final Widget child;
  final List<Override> moreOverrides;
  final ProviderContainer? parent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final futures = [
      if (userId != null) ref.watch(fetchUserProvider(userId!).future),
    ];

    return FutureBuilder(
      future: Future.wait(futures),
      builder: (context, snap) {
        final user = snap.data?.whereType<UserData>().singleOrNull;
        if (user == null) return const ShimmerTile();

        final overrides = [
          currentUserProvider.overrideWith((_) => user),
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
