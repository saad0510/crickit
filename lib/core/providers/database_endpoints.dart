import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/entities/user_data.dart';
import '../../features/teams/entities/team.dart';
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

  late final userImagesRef = ref.read(firebaseStorageProvider).ref('images');
}

final databaseEndpointsProvider = Provider(DatabaseEndpoints.new);
