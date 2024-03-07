import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/sizer.dart';
import '../../../auth/entities/user_data.dart';
import '../../controllers/current_user_provider.dart';
import 'information_card.dart';
import 'information_row.dart';

class ResidenceCard extends ConsumerWidget {
  const ResidenceCard(this.user, {super.key});

  final UserData user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final residence = user.profile.residence;

    final showAddress = !ref.watch(hideSensitiveInfo);

    void open() {}

    return InformationCard(
      title: 'Residency',
      onOpened: open,
      children: [
        InformationRow(
          title: 'City',
          value: residence.city,
        ),
        AppSizes.tinyY,
        InformationRow(
          title: 'Country',
          value: residence.country,
        ),
        AppSizes.tinyY,
        if (showAddress) ...[
          InformationRow(
            title: 'Current Address',
            value: residence.currentAddress.toString(),
          ),
          AppSizes.tinyY,
          InformationRow(
            title: 'Permanent Address',
            value: residence.permanentAddress.toString(),
          ),
          AppSizes.tinyY,
        ],
      ],
    );
  }
}
