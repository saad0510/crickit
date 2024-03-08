import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/extensions/list_ext.dart';
import '../../auth/controllers/user_provider.dart';
import '../../auth/entities/user_data.dart';
import '../entities/team.dart';
import '../entities/team_member.dart';
import '../entities/team_position.dart';
import '../entities/team_role.dart';
import '../repositories/teams_repo.dart';
import 'current_team_provider.dart';

class CurrentTeamNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  Team get team => ref.read(currentTeamProvider);

  void updateTeam(Team team) {
    ref.read(currentTeamProvider.notifier).state = team;
  }

  Future<void> save() {
    return ref.watch(teamsRepoProvider).putTeam(team);
  }

  bool hasMember(UserData user) {
    return team.members.find((m) => m.uid == user.uid) != null;
  }

  void addMember(UserData user) {
    final members = [
      ...team.members,
      TeamMember(
        uid: user.uid,
        position: TeamPosition.captain,
        role: TeamRole.allRounder,
        battingOrder: 0,
        bowlingOrder: 0,
        joinedAt: DateTime.now(),
      ),
    ];
    updateTeam(
      team.copyWith(members: members),
    );
  }

  void updateMember(TeamMember member) {
    final members = [
      for (final m in team.members)
        if (m.uid == member.uid) member else m
    ];
    updateTeam(
      team.copyWith(members: members),
    );
  }

  void removeMember(UserData user) {
    final members = [
      for (final member in team.members)
        if (member.uid != user.uid) member,
    ];
    updateTeam(
      team.copyWith(members: members),
    );
  }

  bool get isCaptain {
    final userId = ref.watch(userIdProvider);
    final userMember = team.members.find((m) => m.uid == userId);
    return userMember?.position.isPrivilged ?? false;
  }

  void battingReorder(int oldIndex, int newIndex) {
    final members = List<TeamMember>.from(team.members);
    members.sort((a, b) => a.battingOrder.compareTo(b.battingOrder));

    final member = members.removeAt(oldIndex).copyWith(battingOrder: newIndex);
    members.insert(newIndex, member);
    updateTeam(
      team.copyWith(members: members),
    );
  }

  void bowlingReorder(int oldIndex, int newIndex) {
    final members = List<TeamMember>.from(team.members);
    members.sort((a, b) => a.bowlingOrder.compareTo(b.bowlingOrder));

    final member = members.removeAt(oldIndex).copyWith(bowlingOrder: newIndex);
    members.insert(newIndex, member);
    updateTeam(
      team.copyWith(members: members),
    );
  }
}

final currentTeamNotifier = NotifierProvider<CurrentTeamNotifier, bool>(
  CurrentTeamNotifier.new,
  dependencies: [currentTeamProvider],
);
