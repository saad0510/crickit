import 'package:flutter/material.dart';

import '../../../../app/sizer.dart';
import '../../../../core/extensions/datetime_ext.dart';
import '../../../auth/entities/user_data.dart';
import 'information_card.dart';
import 'information_row.dart';

class AboutCard extends StatelessWidget {
  const AboutCard(this.user, {super.key});

  final UserData user;

  @override
  Widget build(BuildContext context) {
    return InformationCard(
      title: 'About',
      children: [
        InformationRow(
          title: 'Email',
          value: user.detail.email,
        ),
        AppSizes.tinyY,
        InformationRow(
          title: 'Age',
          value: '${user.detail.birthDate.ageInYears} years old',
        ),
        AppSizes.tinyY,
      ],
    );
  }
}
