import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../../core/extensions/datetime_ext.dart';
import '../../auth/entities/user_data.dart';

class UserSummary extends ConsumerWidget {
  const UserSummary(this.user, {super.key});

  final UserData user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          user.detail.name,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        AppSizes.smallY,
        _IconText(
          Icons.location_on,
          user.profile.residence.city,
        ),
        _IconText(
          Icons.cake,
          '${user.detail.birthDate.ageInYears} years old',
        ),
        _IconText(
          Icons.school,
          user.profile.education.level.toString(),
        ),
        AppSizes.tinyY,
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
