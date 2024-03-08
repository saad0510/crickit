import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../../core/loading/loading_list.dart';
import '../../auth/controllers/user_provider.dart';
import '../../users/controllers/current_user_provider.dart';
import '../../users/controllers/filtered_users_provider.dart';
import '../../users/widgets/user_tile.dart';
import '../controllers/current_team_notifier.dart';
import '../widgets/save_team_button.dart';
import '../widgets/team_constraint_row.dart';

class SelectMembersScreen extends ConsumerStatefulWidget {
  const SelectMembersScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SelectMembersScreenState();
}

class _SelectMembersScreenState extends ConsumerState<SelectMembersScreen> {
  @override
  Widget build(BuildContext context) {
    final team = ref.watch(currentTeamNotifier);
    final notifier = ref.watch(currentTeamNotifier.notifier);

    final members = team.members;
    final validMembers = members.length <= team.constraints.maxPlayers;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Members'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: AppPaddings.normal.copyWith(bottom: 0),
            child: TeamConstraintRow(
              active: validMembers,
              label: '${members.length}/${team.constraints.maxPlayers} team members',
            ),
          ),
          Expanded(
            child: LoadingList(
              value: ref.watch(filteredUsersProvider),
              emptyMessage: 'No users found',
              separator: const SizedBox.shrink(),
              builder: (user, i) {
                return ProviderScope(
                  overrides: [
                    currentUserProvider.overrideWith((_) => user),
                  ],
                  child: UserTile(
                    trailing: Checkbox(
                      value: notifier.hasMember(user),
                      onChanged: (x) => x == true //
                          ? notifier.addMember(user)
                          : notifier.removeMember(user),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const SaveTeamButton(),
    );
  }

  @override
  void initState() {
    super.initState();
    setFilters();
  }

  void setFilters() async {
    await Future.value();
    final userId = ref.read(userIdProvider);
    final updateFilters = ref.read(userFiltersProvider.notifier).update;
    updateFilters((f) => f.copyWith(excludeUsers: [userId]));
  }
}
