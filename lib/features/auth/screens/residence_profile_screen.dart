import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../users/controllers/current_user_provider.dart';
import '../controllers/countries_provider.dart';
import '../entities/user_profile.dart';
import '../widgets/app_autocomplete_field.dart';
import '../widgets/app_text_field.dart';
import '../widgets/main_title.dart';

class ResidenceProfileScreen extends ConsumerWidget {
  const ResidenceProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(currentUserProvider).profile;

    void update(UserProfile newProfile) {
      final user = ref.read(currentUserProvider);
      final notifier = ref.read(currentUserProvider.notifier);
      notifier.state = user.copyWith(profile: newProfile);
    }

    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: SingleChildScrollView(
        padding: AppPaddings.normal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const MainTitle('Residency'),
            AppSizes.largeY,
            AppTextField.name(
              label: 'City',
              hint: 'Enter current city of residence',
              initialValue: profile.residence.city,
              listenChanges: true,
              onSubmit: (x) => update(
                profile.copyWith(
                  residence: profile.residence.copyWith(city: x),
                ),
              ),
            ),
            AppSizes.normalY,
            AppAutocompleteField(
              label: 'Country',
              hint: 'Enter country of residence',
              initial: profile.residence.country,
              values: ref.watch(countriesProvider).asData?.value ?? const <String>[],
              onSelected: (x) => update(
                profile.copyWith(
                  residence: profile.residence.copyWith(country: x),
                ),
              ),
            ),
            AppSizes.normalY,
            AppTextField.name(
              label: 'Current Address',
              hint: 'Enter your current address',
              initialValue: profile.residence.currentAddress,
              listenChanges: true,
              onSubmit: (x) => update(
                profile.copyWith(
                  residence: profile.residence.copyWith(currentAddress: x),
                ),
              ),
            ),
            AppSizes.normalY,
            AppTextField.name(
              label: 'Permanent Address',
              hint: 'Enter your permanent home address',
              initialValue: profile.residence.permanentAddress,
              listenChanges: true,
              onSubmit: (x) => update(
                profile.copyWith(
                  residence: profile.residence.copyWith(permanentAddress: x),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
