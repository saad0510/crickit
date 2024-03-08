import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entities/team.dart';
import '../repositories/teams_repo.dart';

final currentTeamProvider = StateProvider<Team>(
  (ref) => throw UnimplementedError(),
  name: 'current_team',
);

final fetchTeamProvider = FutureProvider.family<Team, String>(
  (ref, teamId) => ref.watch(teamsRepoProvider).getTeam(teamId),
  name: 'fetch_team',
);
