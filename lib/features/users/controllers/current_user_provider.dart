import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/controllers/user_provider.dart';
import '../../auth/entities/user_data.dart';

final currentUserProvider = StateProvider<UserData>(
  (ref) => ref.watch(userProvider),
  name: 'current_user',
);

final hideSensitiveInfo = Provider<bool>((ref) => false);
