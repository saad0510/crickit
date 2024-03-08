import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/extensions/list_ext.dart';
import '../../auth/controllers/user_provider.dart';
import '../entities/team.dart';
import '../repositories/teams_repo.dart';

final teamsProvider = StreamProvider<List<Team>>(
  (ref) => ref.watch(teamsRepoProvider).getAllTeams(),
  name: 'all_teams',
);

final joinedTeamsProvider = FutureProvider<List<Team>>(
  (ref) async {
    final userId = ref.watch(userIdProvider);
    final teams = await ref.watch(teamsProvider.future);
    final userTeams = teams.where((t) => t.members.find((m) => m.uid == userId) != null);
    return userTeams.toList();
  },
  name: 'joined_teams',
);

final availableTeamsProvider = FutureProvider<List<Team>>(
  (ref) async {
    final teams = await ref.watch(teamsProvider.future);
    return teams.where((t) => t.isAvailable).toList();
  },
  name: 'available_teams',
);
