import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../users/repositories/user_repo.dart';
import '../entities/user_data.dart';
import 'auth_notifier.dart';

class UserNotifier extends StreamNotifier<UserData?> {
  late final userRepo = ref.watch(userRepoProvider);

  @override
  Stream<UserData?> build() {
    final uid = ref.watch(authNotifier);
    if (uid == null) return Stream.value(null);
    return userRepo.streamUser(uid);
  }

  Future<void> changeProfilePic(Uint8List bytes) async {
    final oldUser = state.requireValue!;
    final url = await ref.watch(userRepoProvider).uploadImage(oldUser.uid, bytes);
    final user = oldUser.copyWith(
      detail: oldUser.detail.copyWith(imageUrl: url),
    );
    await updateUser(user);
  }

  Future<void> updateUserWith(UserData Function(UserData) newUser) {
    return updateUser(
      newUser(state.valueOrNull!),
    );
  }

  Future<void> updateUser(UserData user) {
    return userRepo.updateUser(user);
  }
}

final userNotifierProvider = StreamNotifierProvider<UserNotifier, UserData?>(
  UserNotifier.new,
  name: 'user_notifier',
);
