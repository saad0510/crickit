import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../auth/entities/user_data.dart';
import '../controllers/current_user_provider.dart';
import 'user_image.dart';
import 'user_image_picker.dart';

class UserSummary extends ConsumerWidget {
  const UserSummary(this.user, {super.key});

  final UserData user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final publicView = ref.watch(hideSensitiveInfo);

    return Row(
      children: [
        if (publicView)
          UserImage(
            user.detail.imageUrl,
            radius: 80,
          )
        else
          const UserImagePicker(radius: 80),
        AppSizes.smallX,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                user.detail.name,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              AppSizes.tinyY,
              _IconText(
                Icons.person_3,
                user.profile.skills.playerType.toString(),
              ),
              const _IconText(
                Icons.sports_cricket,
                '0 Matches',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _IconText extends StatelessWidget {
  const _IconText(this.icon, this.text);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18.sp,
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Text(text),
        ),
      ],
    );
  }
}
