import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../../core/extensions/context_ext.dart';
import '../../../core/loading/loading_elevated_button.dart';
import '../../auth/controllers/user_notifier.dart';
import '../controllers/current_user_provider.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key, required this.screen});

  final Widget screen;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final oldUser = ref.read(currentUserProvider).copyWith();

    return ProviderScope(
      overrides: [
        hideSensitiveInfo.overrideWithValue(true),
        currentUserProvider.overrideWith((_) => oldUser),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile'),
        ),
        body: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.always,
          child: widget.screen,
        ),
        bottomSheet: const Divider(height: 0),
        bottomNavigationBar: Padding(
          padding: AppPaddings.normal,
          child: Consumer(
            builder: (context, ref, _) {
              return LoadingElevatedButton(
                onPressed: () async {
                  final isValid = formKey.currentState?.validate() ?? false;
                  if (!isValid) return;

                  final user = ref.read(currentUserProvider);
                  await ref.read(userNotifierProvider.notifier).updateUser(user);
                  if (context.mounted) context.pop();
                },
                child: const Text('Save'),
              );
            },
          ),
        ),
      ),
    );
  }
}
