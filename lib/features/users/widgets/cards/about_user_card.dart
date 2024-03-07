import 'package:flutter/material.dart';

import '../../../../app/sizer.dart';
import '../../../auth/entities/user_data.dart';
import 'information_card.dart';
import 'information_row.dart';

class AboutUserCard extends StatelessWidget {
  const AboutUserCard(this.user, {super.key});

  final UserData user;

  @override
  Widget build(BuildContext context) {
    final profile = user.profile;

    return InformationCard(
      title: 'Details',
      expanded: true,
      children: [
        InformationRow(
          title: 'Height (Feet)',
          value: profile.height.toStringAsFixed(1),
        ),
        AppSizes.tinyY,
        InformationRow(
          title: 'Weight (Kilograms)',
          value: profile.weight.toStringAsFixed(1),
        ),
        AppSizes.tinyY,
      ],
    );
  }
}
