import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../users/controllers/current_user_provider.dart';
import '../entities/enums/gender.dart';
import '../entities/user_profile.dart';

class GenderProfileScreen extends ConsumerWidget {
  const GenderProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final disabled = ref.watch(hideSensitiveInfo);
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
              'Gender',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            AppSizes.normalY,
            for (final gender in Gender.values) ...[
              CheckboxListTile(
                value: profile.gender == gender,
                selected: profile.gender == gender,
                title: Text(gender.toString()),
                secondary: Icon(gender.icon),
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: disabled
                    ? null
                    : (_) => update(
                          profile.copyWith(gender: gender),
                        ),
              ),
              AppSizes.smallY,
            ],
          ],
        ),
      ),
    );
  }
}
