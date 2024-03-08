import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/database_endpoints.dart';
import '../../auth/entities/user_data.dart';
import '../entities/user_meta_data.dart';

class UserRepo {
  final DatabaseEndpoints endpoints;

  const UserRepo({
    required this.endpoints,
  });

  Future<UserData> getUser(String uid) async {
    final user = await endpoints.usersRef.doc(uid).get();
    return user.data()!;
  }

  Future<List<UserData>> getAllUsers() async {
    final users = await endpoints.usersRef.get();
    return users.docs.map((u) => u.data()).toList();
  }

  Future<void> updateUser(UserData user) async {
    await endpoints.usersRef.doc(user.uid).set(user);
  }

  Stream<UserData> streamUser(String uid) {
    final snap = endpoints.usersRef.doc(uid).snapshots();
    return snap.map((doc) => doc.data()!);
  }

  Future<String> uploadImage(String userId, Uint8List bytes) async {
    final task = await endpoints.userImagesRef.child(userId).putData(bytes);
    return task.ref.getDownloadURL();
  }

  Future<UserMetaData> getMetadata(String userId) async {
    final snap = await endpoints.usersMetaDataRef.child(userId).get();
    return UserMetaData.fromMap(snap.value ?? const {});
  }

  Future<void> updateMetadata(String userId, UserMetaData metaData) async {
    await endpoints.usersMetaDataRef.child(userId).set(metaData.toMap());
  }
}

final userRepoProvider = Provider(
  (ref) => UserRepo(
    endpoints: ref.watch(databaseEndpointsProvider),
  ),
);
