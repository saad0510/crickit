import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/entities/user_data.dart';
import '../../features/teams/entities/team.dart';
import '../../features/teams/entities/team_member.dart';
import 'firebase_providers.dart';

class DatabaseEndpoints {
  final Ref ref;

  DatabaseEndpoints(this.ref);

  late final usersRef = ref
      .read(firestoreProvider) //
      .collection('users')
      .withConverter(
        fromFirestore: (doc, _) => UserData.fromMap(doc.data()),
        toFirestore: (user, _) => user.toMap(),
      );

  late final usersMetaDataRef = ref
      .read(fireDatabaseProvider) //
      .ref('users_data');

  late final teamsRef = ref
      .read(firestoreProvider) //
      .collection('teams')
      .withConverter(
        fromFirestore: (doc, _) => Team.fromMap(doc.data()),
        toFirestore: (team, _) => team.toMap(),
      );

  CollectionReference<TeamMember> teamMembersRef(String teamId) {
    return ref
        .read(firestoreProvider) //
        .collection('teams')
        .doc(teamId)
        .collection('members')
        .withConverter(
          fromFirestore: (doc, _) => TeamMember.fromMap(doc.data()),
          toFirestore: (member, _) => member.toMap(),
        );
  }
}

final databaseEndpointsProvider = Provider(DatabaseEndpoints.new);
