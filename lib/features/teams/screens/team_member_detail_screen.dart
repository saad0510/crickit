import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../../core/extensions/datetime_ext.dart';
import '../../auth/widgets/app_drop_down_field.dart';
import '../../users/controllers/current_user_provider.dart';
import '../../users/widgets/cards/information_row.dart';
import '../../users/widgets/user_tile.dart';
import '../controllers/current_team_member_provider.dart';
import '../controllers/current_team_notifier.dart';
import '../entities/team_member.dart';
import '../entities/team_position.dart';
import '../entities/team_role.dart';
import '../widgets/save_team_button.dart';
import '../widgets/team_constraints_card.dart';

class TeamMemberDetailScreen extends ConsumerWidget {
  const TeamMemberDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final member = ref.watch(currentTeamMemberProvider);
    final notifier = ref.read(currentTeamNotifier.notifier);

    void update(TeamMember newMember) {
      notifier.updateMember(newMember);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(user.detail.name),
      ),
      body: SingleChildScrollView(
        padding: AppPaddings.normal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Position',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            AppSizes.smallY,
            AppDropDownField(
              values: TeamPosition.values,
              initial: member.position,
              onSelected: (x) => update(member.copyWith(position: x)),
            ),
            AppSizes.smallY,
            Text(
              'Role',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            AppSizes.smallY,
            AppDropDownField(
              values: TeamRole.values,
              initial: member.role,
              onSelected: (x) => update(member.copyWith(role: x)),
            ),
            AppSizes.smallY,
            InformationRow(
              title: 'Joined At',
              value: member.joinedAt.dateFormatedLong,
            ),
            AppSizes.normalY,
            const UserTile(),
            AppSizes.normalY,
            const TeamConstraintsCard(),
          ],
        ),
      ),
      bottomNavigationBar: const SaveTeamButton(),
    );
  }
}
