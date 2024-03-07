import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/entities/user_data.dart';
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
}

final databaseEndpointsProvider = Provider(DatabaseEndpoints.new);
