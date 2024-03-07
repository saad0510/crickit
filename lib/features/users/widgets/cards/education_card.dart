import 'package:flutter/material.dart';

import '../../../../app/sizer.dart';
import '../../../../core/extensions/datetime_ext.dart';
import '../../../auth/entities/user_data.dart';
import 'information_card.dart';
import 'information_row.dart';

class EducationCard extends StatelessWidget {
  const EducationCard(this.user, {super.key});

  final UserData user;

  @override
  Widget build(BuildContext context) {
    final education = user.profile.education;

    void open() {}

    return InformationCard(
      title: 'Education',
      onOpened: open,
      children: [
        InformationRow(
          title: 'Institute',
          value: education.institute,
        ),
        AppSizes.tinyY,
        InformationRow(
          title: 'Degree',
          value: education.position,
        ),
        AppSizes.tinyY,
        InformationRow(
          title: 'Level',
          value: education.level.toString(),
        ),
        AppSizes.tinyY,
        InformationRow(
          title: 'Start Date',
          value: education.startDate.dateFormatedLong,
        ),
        AppSizes.tinyY,
        InformationRow(
          title: 'End Date',
          value: education.endDate?.dateFormatedLong ?? 'Ongoing',
        ),
        AppSizes.tinyY,
      ],
    );
  }
}
