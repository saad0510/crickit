import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../../core/loading/loading_widget.dart';
import '../../home/widgets/logout_button.dart';
import '../controllers/user_provider.dart';
import '../repositories/auth_repo.dart';
import '../widgets/highlighted_text_button.dart';

class EmailVerificationScreen extends ConsumerStatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends ConsumerState<EmailVerificationScreen> {
  @override
  Widget build(BuildContext context) {
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
              text: 'We have sent a verification code at $email. Enter it below to proceed ahead',
              highlight: email,
              onPressed: null,
            ),
            AppSizes.largeY,
            AppSizes.largeY,
            LoadingWidget(
              value: ref.watch(_emailVerificationProvider),
              builder: (_) {
                return const Text('anything');
              },
            ),
          ],
        ),
      ),
      bottomSheet: const Divider(height: 0),
    );
  }
}

final _emailVerificationProvider = FutureProvider<void>(
  (ref) {
    return ref.watch(authRepoProvider).sendEmailVerification();
  },
);
