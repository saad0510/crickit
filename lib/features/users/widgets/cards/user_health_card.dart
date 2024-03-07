import 'package:flutter/material.dart';

import '../../../../app/sizer.dart';
import '../../../auth/entities/user_data.dart';
import 'information_card.dart';
import 'information_row.dart';

class UserHealthCard extends StatelessWidget {
  const UserHealthCard(this.user, {super.key});

  final UserData user;

  @override
  Widget build(BuildContext context) {
    final health = user.profile.health;

    return InformationCard(
      title: 'Health',
      expanded: true,
      children: [
        InformationRow(
          title: 'Smoking',
          value: health.smoking ? 'Yes' : 'No',
        ),
        AppSizes.tinyY,
        InformationRow(
          title: 'Height (Feet)',
          value: health.height.toStringAsFixed(1),
        ),
        AppSizes.tinyY,
        InformationRow(
          title: 'Weight (Kilograms)',
          value: health.weight.toStringAsFixed(1),
        ),
        AppSizes.tinyY,
      ],
    );
  }
}
