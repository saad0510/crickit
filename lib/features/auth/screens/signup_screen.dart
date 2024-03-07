import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/routes.dart';
import '../../../app/sizer.dart';
import '../../../core/extensions/context_ext.dart';
import '../../../core/loading/loading_elevated_button.dart';
import '../../../core/utils/form_validations.dart';
import '../controllers/auth_notifier.dart';
import '../controllers/user_notifier.dart';
import '../entities/user_detail.dart';
import '../widgets/app_date_picker_field.dart';
import '../widgets/app_text_field.dart';
import '../widgets/highlighted_text_button.dart';
import '../widgets/main_title.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final formKey = GlobalKey<FormState>();

  UserDetail user = UserDetail.empty();
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
              const MainTitle(
                'Join us to find your cricket partners!',
              ),
              AppSizes.largeY,
              AppTextField.name(
                label: 'Name',
                hint: 'Enter your full name',
                onSubmit: (x) => user = user.copyWith(name: x),
              ),
              AppSizes.normalY,
              AppTextField.email(
                label: 'Email',
                hint: 'Enter your email address',
                onSubmit: (x) => user = user.copyWith(email: x),
              ),
              AppSizes.normalY,
              AppTextField.password(
                label: 'Password',
                hint: 'Enter your password',
                listenChanges: true,
                onSubmit: (x) => password = x,
              ),
              AppSizes.normalY,
              AppTextField.password(
                label: 'Confirm Password',
                hint: 'Re-enter your password',
                onSubmit: (x) {},
                validator: (x) => FormValidations.confirmPassword(x, password),
              ),
              AppSizes.normalY,
              AppDatePickerField(
                label: 'Birth Date',
                maxDate: DateTime.now(),
                onChanged: (x) => user = user.copyWith(birthDate: x),
              ),
              AppSizes.largeY,
              LoadingElevatedButton(
                onPressed: submit,
                child: const Text('Sign Up'),
              ),
              HighlightedTextButton(
                text: "Already have an account? Login",
                highlight: 'Login',
                onPressed: () => context.replace(AppRoutes.login),
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

    final u = await ref.read(authNotifier.notifier).signup(user, password);
    await ref.read(userNotifierProvider.notifier).updateUser(u);
  }
}
