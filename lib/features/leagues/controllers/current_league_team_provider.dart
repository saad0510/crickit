import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entities/league_team.dart';

final currentLeagueTeamProvider = Provider<LeagueTeam>(
  (ref) => throw UnimplementedError(),
  name: 'current_league_team_provider',
);
