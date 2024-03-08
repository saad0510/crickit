import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/routes.dart';
import '../../../app/sizer.dart';
import '../../../core/extensions/context_ext.dart';
import '../../../core/loading/loading_elevated_button.dart';
import '../../../core/utils/form_validations.dart';
import '../controllers/auth_notifier.dart';
import '../widgets/app_text_field.dart';
import '../widgets/highlighted_text_button.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: SingleChildScrollView(
        padding: AppPaddings.normal,
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Find your perfect cricket team today!',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              AppSizes.largeY,
              AppTextField.email(
                label: 'Email',
                hint: 'Enter your email address',
                onSubmit: (x) => email = x,
              ),
              AppSizes.normalY,
              AppTextField.password(
                label: 'Password',
                hint: 'Enter your password',
                validator: FormValidations.longInput,
                onSubmit: (x) => password = x,
              ),
              AppSizes.normalY,
              LoadingElevatedButton(
                onPressed: submit,
                child: const Text('Login'),
              ),
              AppSizes.tinyY,
              HighlightedTextButton(
                text: "Don't have an account? Sign up",
                highlight: 'Sign up',
                onPressed: () => context.replace(AppRoutes.signup),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> submit() async {
    final isValid = formKey.currentState?.validate() ?? false;
    if (isValid == false) return;
    formKey.currentState?.save();

    await ref.read(authNotifier.notifier).login(email, password);
  }
}
