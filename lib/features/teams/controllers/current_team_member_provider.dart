import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entities/team_member.dart';

final currentTeamMemberProvider = StateProvider<TeamMember>(
  (ref) => throw UnimplementedError(),
  name: 'current_team_member',
);
