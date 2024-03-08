import '../../../core/utils/compare.dart';
import 'team_position.dart';
import 'team_role.dart';

class TeamMember with Compare<TeamMember> {
  final String uid;
  final TeamPosition position;
  final TeamRole role;
  final int battingOrder;
  final int bowlingOrder;
  final DateTime joinedAt;

  const TeamMember({
    required this.uid,
    required this.position,
    required this.role,
    required this.battingOrder,
    required this.bowlingOrder,
    required this.joinedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'position': position.toMap(),
      'role': role.toMap(),
      'battingOrder': battingOrder,
      'bowlingOrder': bowlingOrder,
      'joinedAt': joinedAt.millisecondsSinceEpoch,
    };
  }

  factory TeamMember.fromMap(dynamic data) {
    final map = Map<String, dynamic>.from(data);

    return TeamMember(
      uid: map['uid'],
      position: TeamPosition.fromMap(map['position']),
      role: TeamRole.fromMap(map['role']),
      battingOrder: map['battingOrder'],
      bowlingOrder: map['bowlingOrder'],
      joinedAt: DateTime.fromMillisecondsSinceEpoch(map['joinedAt']),
    );
  }

  TeamMember copyWith({
    String? uid,
    TeamPosition? position,
    TeamRole? role,
    int? battingOrder,
    int? bowlingOrder,
    DateTime? joinedAt,
  }) {
    return TeamMember(
      uid: uid ?? this.uid,
      position: position ?? this.position,
      role: role ?? this.role,
      battingOrder: battingOrder ?? this.battingOrder,
      bowlingOrder: bowlingOrder ?? this.bowlingOrder,
      joinedAt: joinedAt ?? this.joinedAt,
    );
  }

  @override
  int compareTo(TeamMember other) {
    return position.index.compareTo(other.position.index);
  }
}
