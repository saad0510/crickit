import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/entities/user_data.dart';
import '../repositories/user_repo.dart';

final usersProvider = FutureProvider<List<UserData>>(
  (ref) => ref.watch(userRepoProvider).getAllUsers(),
  name: 'users',
);
