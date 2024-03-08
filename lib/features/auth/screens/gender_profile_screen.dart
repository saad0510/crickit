import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/constants.dart';
import '../../../app/sizer.dart';
import '../../../core/extensions/num_ext.dart';
import '../../../core/utils/form_validations.dart';
import '../../users/controllers/current_user_provider.dart';
import '../entities/enums/gender.dart';
import '../entities/user_profile.dart';
import '../widgets/app_text_field.dart';

class GenderProfileScreen extends ConsumerWidget {
  const GenderProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(currentUserProvider).profile;
    final health = profile.health;

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
            Text(
              'Gender',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            AppSizes.normalY,
            for (final gender in Gender.values) ...[
              CheckboxListTile(
                value: profile.gender == gender,
                selected: profile.gender == gender,
                title: Text(
                  gender.toString(),
                  style: const TextStyle(color: Colors.black),
                ),
                secondary: Icon(gender.icon),
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (_) => update(
                  profile.copyWith(gender: gender),
                ),
              ),
              AppSizes.smallY,
            ],
            AppSizes.normalY,
            Text(
              'Bio',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            AppSizes.normalY,
            AppTextField(
              label: '',
              hint: 'Tell us a little about yourself',
              listenChanges: true,
              initialValue: profile.bio,
              validator: (x) => FormValidations.bio(x),
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.sentences,
              maxLines: 3,
              sideInfo: '${profile.bio.length}/${AppConstants.bioMaxCount}',
              onSubmit: (x) => update(
                profile.copyWith(bio: x),
              ),
            ),
            AppSizes.normalY,
            Text(
              'Health',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            AppSizes.normalY,
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Do you smoke?',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Switch(
                  value: health.smoking,
                  onChanged: (x) => update(
                    profile.copyWith(health: health.copyWith(smoking: x)),
                  ),
                ),
              ],
            ),
            AppSizes.normalY,
            AppTextField.number(
              label: 'Height',
              hint: 'Enter your height',
              suffix: 'Feet',
              listenChanges: true,
              initialValue: health.height.nullIfNeg?.toString(),
              onSubmit: (x) => update(
                profile.copyWith(
                  health: health.copyWith(height: double.parse(x)),
                ),
              ),
            ),
            AppSizes.normalY,
            AppTextField.number(
              label: 'Weight',
              hint: 'Enter your weight',
              suffix: 'Kilograms',
              listenChanges: true,
              initialValue: health.weight.nullIfNeg?.toString(),
              onSubmit: (x) => update(
                profile.copyWith(
                  health: health.copyWith(weight: double.parse(x)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
