import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../../core/extensions/context_ext.dart';
import '../../../core/loading/loading_elevated_button.dart';
import '../controllers/current_team_notifier.dart';

class SaveTeamButton extends ConsumerWidget {
  const SaveTeamButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final team = ref.watch(currentTeamNotifier);
    final notifier = ref.read(currentTeamNotifier.notifier);
    if (!notifier.isCaptain) return const SizedBox.shrink();

    Future<void> save() async {
      await notifier.save();
      if (context.mounted) context.popTillFirst();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Divider(height: 0),
        Padding(
          padding: AppPaddings.normal,
          child: LoadingElevatedButton(
            onPressed: team.isValid ? save : null,
            child: const Text('Save'),
          ),
        ),
      ],
    );
  }
}
