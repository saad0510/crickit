import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/entities/user_data.dart';
import '../entities/users_filters.dart';
import 'users_provider.dart';

final userFiltersProvider = StateProvider<UsersFilters>(
  (ref) => const UsersFilters.none(),
);

final filteredUsersProvider = FutureProvider<List<UserData>>(
  (ref) async {
    final filters = ref.watch(userFiltersProvider);
    final users = await ref.watch(usersProvider.future);
    return filters.apply(users);
  },
);
