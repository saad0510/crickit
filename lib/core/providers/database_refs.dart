import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/entities/user_data.dart';
import 'firebase_providers.dart';

final usersRef = Provider<CollectionReference<UserData>>(
  (ref) => ref
      .watch(firestoreProvider) //
      .collection('users')
      .withConverter(
        fromFirestore: (doc, _) => UserData.fromMap(doc.data()),
        toFirestore: (user, _) => user.toMap(),
      ),
);

final chatsRef = Provider<DatabaseReference>(
  (ref) => ref
      .watch(fireDatabaseProvider) //
      .ref('chats'),
);

final usersMetaDataRef = Provider<DatabaseReference>(
  (ref) => ref
      .watch(fireDatabaseProvider) //
      .ref('users_data'),
);
