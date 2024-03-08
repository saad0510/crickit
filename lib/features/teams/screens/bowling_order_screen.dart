import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../../core/extensions/context_ext.dart';
import '../../../core/loading/loading_elevated_button.dart';
import '../../users/controllers/override_widget.dart';
import '../controllers/current_team_member_provider.dart';
import '../controllers/current_team_notifier.dart';
import '../controllers/current_team_provider.dart';
import '../entities/team_member.dart';
import '../widgets/team_member_tile.dart';

class BowlingOrderScreen extends ConsumerWidget {
  const BowlingOrderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final team = ref.watch(currentTeamProvider);
    final notifier = ref.read(currentTeamNotifier.notifier);

    Future<void> save() async {
      await notifier.save();
      if (context.mounted) context.popTillFirst();
    }

    final members = List<TeamMember>.from(team.members);
    members.sort((a, b) => a.bowlingOrder.compareTo(b.bowlingOrder));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bowling Order'),
      ),
      body: ReorderableListView.builder(
        itemCount: members.length,
        padding: AppPaddings.normal.copyWith(top: 0),
        itemBuilder: (_, i) {
          final member = members[i];

          return OverrideWidget(
            key: ValueKey(member.uid),
            userId: member.uid,
            parent: ProviderScope.containerOf(context),
            moreOverrides: [
              currentTeamMemberProvider.overrideWith((_) => member),
            ],
            child: Padding(
              padding: AppPaddings.tinyY,
              child: const TeamMemberTile(),
            ),
          );
        },
        onReorder: (oldIndex, newIndex) {
          if (oldIndex < newIndex) newIndex -= 1;
          notifier.bowlingReorder(oldIndex, newIndex);
        },
      ),
      bottomSheet: const Divider(height: 0),
      bottomNavigationBar: Padding(
        padding: AppPaddings.normal,
        child: LoadingElevatedButton(
          onPressed: team.isValid ? save : null,
          child: const Text('Save'),
        ),
      ),
    );
  }
}
