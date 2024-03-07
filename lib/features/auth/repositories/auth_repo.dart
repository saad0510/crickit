import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/providers/firebase_providers.dart';

class AuthRepo {
  final FirebaseAuth auth;

  const AuthRepo({required this.auth});

  String? silentLogin() {
    final user = auth.currentUser;
    return user?.uid;
  }

  Future<String> login(String email, String password) async {
    final credits = await auth.signInWithEmailAndPassword(email: email, password: password);
    final user = credits.user!;
    return user.uid;
  }

  Future<String> register(String email, String password) async {
    final credits = await auth.createUserWithEmailAndPassword(email: email, password: password);
    final user = credits.user!;
    return user.uid;
  }

  Future<User> continueWithGoogle() async {
    final gUser = await GoogleSignIn().signIn();
    if (gUser == null) throw 'ignore';

    final gAuth = await gUser.authentication;
    final gTokens = GoogleAuthProvider.credential(accessToken: gAuth.accessToken, idToken: gAuth.idToken);
    final credits = await auth.signInWithCredential(gTokens);
    final user = credits.user!;
    return user;
  }

  Future<void> logout() async {
    await auth.signOut();
  }

  Future<bool> isEmailVerified() async {
    await auth.currentUser!.reload();
    return auth.currentUser!.emailVerified;
  }

  Future<void> sendEmailVerification() async {
    await auth.currentUser!.sendEmailVerification();
  }
}

final authRepoProvider = Provider(
  (ref) => AuthRepo(
    auth: ref.watch(fireAuthProvider),
  ),
);
