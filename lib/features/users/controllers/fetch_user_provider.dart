import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/entities/user_data.dart';
import '../repositories/user_repo.dart';

final fetchUserProvider = FutureProvider.family<UserData, String>(
  (ref, userId) {
    return ref.watch(userRepoProvider).getUser(userId);
  },
  name: 'fetch_user',
);
