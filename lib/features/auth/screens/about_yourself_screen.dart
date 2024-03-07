import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../../core/extensions/num_ext.dart';
import '../../users/controllers/current_user_provider.dart';
import '../entities/user_profile.dart';
import '../widgets/app_text_field.dart';

class AboutYourselfScreen extends ConsumerWidget {
  const AboutYourselfScreen({super.key});

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
            Text(
              'About Yourself',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            AppSizes.normalY,
            AppTextField.number(
              label: 'Height',
              hint: 'Enter your height',
              suffix: 'Feet',
              listenChanges: true,
              initialValue: profile.height.nullIfNeg?.toString(),
              onSubmit: (x) => update(
                profile.copyWith(height: double.parse(x)),
              ),
            ),
            AppSizes.normalY,
            AppTextField.number(
              label: 'Weight',
              hint: 'Enter your weight',
              suffix: 'Kilograms',
              listenChanges: true,
              initialValue: profile.weight.nullIfNeg?.toString(),
              onSubmit: (x) => update(
                profile.copyWith(weight: double.parse(x)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
