import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../../core/extensions/context_ext.dart';
import '../../../core/loading/loading_elevated_button.dart';
import '../../../core/loading/loading_list.dart';
import '../../users/controllers/current_user_provider.dart';
import '../../users/controllers/filtered_users_provider.dart';
import '../../users/widgets/user_tile.dart';
import '../controllers/current_team_notifier.dart';
import '../controllers/current_team_provider.dart';
import '../widgets/team_constraint_row.dart';

class SelectMembersScreen extends ConsumerWidget {
  const SelectMembersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final team = ref.watch(currentTeamProvider);
    final notifier = ref.watch(currentTeamNotifier.notifier);

    final members = team.members;
    final validMembers = members.length <= team.constraints.maxPlayers;

    Future<void> save() async {
      await notifier.save();
      if (context.mounted) context.pop();
    }

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
      bottomSheet: const Divider(height: 0),
      bottomNavigationBar: Padding(
        padding: AppPaddings.normal,
        child: LoadingElevatedButton(
          onPressed: team.members.isEmpty ? null : save,
          child: const Text('Save'),
        ),
      ),
    );
  }
}
