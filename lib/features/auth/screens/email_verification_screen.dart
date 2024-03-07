import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../home/widgets/logout_button.dart';
import '../controllers/user_provider.dart';
import '../widgets/highlighted_text_button.dart';

class EmailVerificationScreen extends ConsumerWidget {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(userProvider.select((u) => u.detail.email));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm Your Email'),
        actions: const [LogoutButton.short()],
      ),
      body: SingleChildScrollView(
        padding: AppPaddings.normal,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppSizes.normalY,
            HighlightedTextButton(
              text: 'We have sent a verification email at $email.',
              highlight: email,
              onPressed: null,
            ),
          ],
        ),
      ),
      bottomSheet: const Divider(height: 0),
    );
  }
}
