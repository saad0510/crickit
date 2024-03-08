import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entities/team.dart';

final currentTeamProvider = StateProvider<Team>(
  (ref) => throw UnimplementedError(),
  name: 'current_team',
);
