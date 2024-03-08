import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entities/league.dart';

final currentLeagueProvider = Provider<League>(
  (ref) => throw UnimplementedError(),
  name: 'current_league_member',
);
