import '../../../core/utils/compare.dart';
import 'team_constraints.dart';
import 'team_member.dart';
import 'team_role.dart';

class Team with Compare<Team> {
  final String teamId;
  final String title;
  final String description;
  final TeamConstraints constraints;
  final List<TeamMember> members;
  final String createdBy;
  final DateTime createdAt;

  const Team({
    required this.teamId,
    required this.title,
    required this.description,
    required this.constraints,
    required this.members,
    required this.createdBy,
    required this.createdAt,
  });

  bool get isAvailable => members.length < constraints.maxPlayers;

  bool get isValid =>
      validMembers && //
      validBatsmen &&
      validBowlers &&
      validWicketKeepers;

  bool get validMembers {
    return members.length <= constraints.maxPlayers;
  }

  bool get validBatsmen {
    return membersByRole(TeamRole.batsman).length <= constraints.maxBatsmen;
  }

  bool get validBowlers {
    return membersByRole(TeamRole.bowler).length <= constraints.maxBowlers;
  }

  bool get validWicketKeepers {
    return membersByRole(TeamRole.wicketKeeper).length <= constraints.maxWicketKeepers;
  }

  Iterable<TeamMember> membersByRole(TeamRole role) {
    return members.where((m) => m.role == role);
  }

  Map<String, dynamic> toMap() {
    return {
      'teamId': teamId,
      'title': title,
      'description': description,
      'constraints': constraints.toMap(),
      'members': members.map((x) => x.toMap()).toList(),
      'createdBy': createdBy,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory Team.fromMap(dynamic data) {
    final map = Map<String, dynamic>.from(data);

    return Team(
      teamId: map['teamId'],
      title: map['title'],
      description: map['description'],
      constraints: TeamConstraints.fromMap(map['constraints']),
      members: List.from(map['members']).map(TeamMember.fromMap).toList(),
      createdBy: map['createdBy'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }

  Team copyWith({
    String? teamId,
    String? title,
    String? description,
    TeamConstraints? constraints,
    List<TeamMember>? members,
    String? createdBy,
    DateTime? createdAt,
  }) {
    return Team(
      teamId: teamId ?? this.teamId,
      title: title ?? this.title,
      description: description ?? this.description,
      constraints: constraints ?? this.constraints,
      members: members ?? this.members,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  int compareTo(Team other) {
    return other.createdAt.compareTo(createdAt);
  }
}
