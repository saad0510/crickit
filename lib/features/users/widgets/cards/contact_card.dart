import 'package:flutter/material.dart';

import '../../../../app/sizer.dart';
import '../../../auth/entities/user_data.dart';
import 'information_card.dart';
import 'information_row.dart';

class ContactCard extends StatelessWidget {
  const ContactCard(this.user, {super.key});

  final UserData user;

  @override
  Widget build(BuildContext context) {
    return InformationCard(
      title: 'Contact',
      children: [
        InformationRow(
          title: 'Email',
          value: user.detail.email,
        ),
        AppSizes.tinyY,
        InformationRow(
          title: 'Phone',
          value: user.detail.phone,
        ),
        AppSizes.tinyY,
      ],
    );
  }
}
