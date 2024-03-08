import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../users/controllers/current_user_provider.dart';
import '../entities/user_profile.dart';
import '../widgets/education_field.dart';

class EducationProfileScreen extends ConsumerWidget {
  const EducationProfileScreen({super.key});

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
              'Education',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            AppSizes.normalY,
            EducationField(
              education: profile.education,
              onChanged: (x) => update(
                profile.copyWith(education: x),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
