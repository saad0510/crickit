import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entities/user_data.dart';
import '../entities/user_detail.dart';
import '../entities/user_profile.dart';
import '../repositories/auth_repo.dart';

class AuthNotifier extends Notifier<String?> {
  late final authRepo = ref.watch(authRepoProvider);

  @override
  String? build() => authRepo.silentLogin();

  Future<void> login(String email, String password) async {
    state = await authRepo.login(email, password);
  }

  Future<UserData> signup(UserDetail detail, String password) async {
    state = await authRepo.register(detail.email, password);
    return UserData(
      uid: state!,
      detail: detail,
      profile: UserProfile.empty(),
    );
  }

  Future<UserData> continueWithGoogle() async {
    final user = await authRepo.continueWithGoogle();
    state = user.uid;

    return UserData(
      uid: state!,
      detail: UserDetail(
        name: user.displayName ?? user.providerData.first.displayName!,
        email: user.email ?? user.providerData.first.email!,
        imageUrl: user.photoURL ?? user.providerData.first.photoURL ?? '',
        phone: user.phoneNumber ?? user.providerData.first.phoneNumber ?? '',
        // TODO: take birth date from user
        birthDate: DateTime.now(),
      ),
      profile: UserProfile.empty(),
    );
  }

  Future<void> logout() async {
    await authRepo.logout();
    state = null;
  }
}

final authNotifier = NotifierProvider<AuthNotifier, String?>(
  AuthNotifier.new,
  name: 'auth_notifier',
);
