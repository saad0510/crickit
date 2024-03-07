import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entities/user_data.dart';
import 'user_notifier.dart';

final userProvider = Provider<UserData>(
  (ref) => ref.watch(userNotifierProvider).valueOrNull!,
  name: 'user',
);

final userIdProvider = Provider<String>(
  (ref) => ref.watch(userProvider.select((u) => u.uid)),
  name: 'user_id',
);
