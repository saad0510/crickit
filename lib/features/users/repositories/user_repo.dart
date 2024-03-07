import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/database_refs.dart';
import '../../auth/entities/user_data.dart';
import '../entities/user_meta_data.dart';

class UserRepo {
  final CollectionReference<UserData> dataRef;
  final DatabaseReference metadataRef;

  const UserRepo({
    required this.dataRef,
    required this.metadataRef,
  });

  Future<UserData> getUser(String uid) async {
    final user = await dataRef.doc(uid).get();
    return user.data()!;
  }

  Future<void> updateUser(UserData user) async {
    await dataRef.doc(user.uid).set(user);
  }

  Stream<UserData> streamUser(String uid) {
    final snap = dataRef.doc(uid).snapshots();
    return snap.map((doc) => doc.data()!);
  }

  Future<UserMetaData> getMetadata(String userId) async {
    final snap = await metadataRef.child(userId).get();
    return UserMetaData.fromMap(snap.value ?? const {});
  }

  Future<void> updateMetadata(String userId, UserMetaData metaData) async {
    await metadataRef.child(userId).set(metaData.toMap());
  }
}

final userRepoProvider = Provider(
  (ref) => UserRepo(
    dataRef: ref.watch(usersRef),
    metadataRef: ref.watch(usersMetaDataRef),
  ),
);
