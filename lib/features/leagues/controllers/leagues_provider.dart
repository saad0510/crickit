import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entities/league.dart';
import '../repositories/leagues_repo.dart';

final leaguesProvider = StreamProvider<List<League>>(
  (ref) => ref.watch(leaguesRepoProvider).getAllLeagues(),
  name: 'all_leagues',
);

final availableleaguesProvider = FutureProvider<List<League>>(
  (ref) async {
    final leagues = await ref.watch(leaguesProvider.future);
    return leagues.where((l) => l.isAvailable).toList();
  },
  name: 'available_leagues',
);
