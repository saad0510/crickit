import '../../auth/entities/user_data.dart';

class UsersFilters {
  final String name;
  final List<String> excludeUsers;

  const UsersFilters({
    required this.name,
    required this.excludeUsers,
  });

  const UsersFilters.none()
      : name = '',
        excludeUsers = const [];

  List<UserData> apply(Iterable<UserData> users) {
    users = users.where((u) => !excludeUsers.contains(u.uid));

    if (name.isNotEmpty) //
      users = users.where(
        (u) => u.detail.name.toLowerCase().contains(name.toLowerCase()),
      );

    return users.toList();
  }

  UsersFilters copyWith({
    String? name,
    Iterable<String>? excludeUsers,
  }) {
    return UsersFilters(
      name: name ?? this.name,
      excludeUsers: excludeUsers?.toList() ?? this.excludeUsers,
    );
  }
}
