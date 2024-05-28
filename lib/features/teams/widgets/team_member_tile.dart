import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../../core/extensions/context_ext.dart';
import '../../../core/ui/tags.dart';
import '../../users/controllers/current_user_provider.dart';
import '../../users/screens/other_user_detail_screen.dart';
import '../../users/widgets/user_image.dart';
import '../controllers/current_team_member_provider.dart';
import '../controllers/current_team_notifier.dart';
import '../screens/team_member_detail_screen.dart';

class TeamMemberTile extends ConsumerWidget {
  const TeamMemberTile({
    super.key,
    this.trailing,
  });

  final Widget? trailing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final member = ref.watch(currentTeamMemberProvider);

    return Material(
      elevation: 1,
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        onTap: () {
          final isCaptain = ref.read(currentTeamNotifier.notifier).isCaptain;
          context.pushScreen(
            isCaptain ? const TeamMemberDetailScreen() : const OtherUserDetailScreen(),
          );
        },
        child: Padding(
          padding: AppPaddings.tiny,
          child: Row(
            children: [
              AppSizes.tinyX,
              UserImage(
                user.detail.imageUrl,
                radius: 60,
                userId: user.uid,
              ),
              AppSizes.tinyX,
              AppSizes.tinyX,
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(user.detail.name),
                    AppSizes.tinyY,
                    AppSizes.tinyY,
                    Row(
                      children: [
                        TeamPositionTag(member.position),
                        AppSizes.tinyX,
                        TeamRoleTag(member.role),
                      ],
                    ),
                    AppSizes.smallY,
                  ],
                ),
              ),
              trailing ?? const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
