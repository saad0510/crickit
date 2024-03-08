import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../app/routes.dart';
import '../../../app/sizer.dart';
import '../../../firebase_options.dart';
import 'user_notifier.dart';

final routeProvider = FutureProvider<AppRoutes>(
  (ref) async {
    await Future.wait([
      _initializeApp(),
      Future.delayed(const Duration(seconds: 1)),
    ]);

    final user = await ref.watch(userNotifierProvider.future);

    if (user == null) {
      return AppRoutes.login;
    }

    if (user.detail.isEmpty) {
      return AppRoutes.login;
    }

    if (user.profile.isEmpty) {
      return AppRoutes.completeProfile;
    }

    return AppRoutes.home;
  },
  name: 'route',
);

bool _init = false;
Future<void> _initializeApp() async {
  if (_init) return;
  await AppSizer.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  _init = true;
}
