import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../../core/loading/loading_text_button.dart';
import '../../users/controllers/current_user_provider.dart';
import '../controllers/user_notifier.dart';
import '../widgets/main_title.dart';
import '../widgets/steps_list.dart';
import 'batting_skills_profile_screen.dart';
import 'bowling_skills_profile_screen.dart';
import 'cricket_skills_profile_screen.dart';
import 'education_profile_screen.dart';
import 'fielding_skills_profile_screen.dart';
import 'gender_profile_screen.dart';
import 'residence_profile_screen.dart';
import 'review_profile_screen.dart';

class CompleteProfileScreen extends ConsumerStatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends ConsumerState<CompleteProfileScreen> {
  int currentStep = 0;
  final pageController = PageController();
  final formKey = GlobalKey<FormState>();

  final screens = [
    const GenderProfileScreen(),
    const ResidenceProfileScreen(),
    const CricketSkillsProfileScreen(),
    const BattingSkillsProfileScreen(),
    const BowlingSkillsProfileScreen(),
    const FieldingSkillsProfileScreen(),
    const EducationProfileScreen(),
    const ReviewProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: AppPaddings.normal.copyWith(bottom: 0),
            child: const MainTitle(
              'Complete Profile',
              showLogo: true,
            ),
          ),
          Expanded(
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: PageView.builder(
                itemCount: screens.length,
                controller: pageController,
                onPageChanged: (_) => setState(() {}),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, i) => screens[i],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: IconButtonTheme(
        data: IconButtonThemeData(
          style: IconButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        child: Padding(
          padding: AppPaddings.small,
          child: Row(
            children: [
              IconButton(
                onPressed: isFirstIndex ? null : prevStep,
                icon: const Icon(Icons.arrow_back),
              ),
              Expanded(
                child: Center(
                  heightFactor: 1,
                  child: AnimatedCrossFade(
                    firstCurve: Curves.decelerate,
                    secondCurve: Curves.decelerate,
                    duration: const Duration(milliseconds: 100),
                    crossFadeState: isLastIndex ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                    firstChild: LoadingTextButton(
                      onPressed: save,
                      child: const Text('Save'),
                    ),
                    secondChild: StepsList(
                      active: currentStep,
                      count: screens.length,
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: isLastIndex ? null : nextStep,
                icon: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool get isFirstIndex => currentStep == 0;

  bool get isLastIndex => currentStep + 1 == screens.length;

  void nextStep() {
    if (isValid() == false) return;
    pageController.animateToPage(
      ++currentStep,
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
    );
  }

  void prevStep() {
    pageController.animateToPage(
      --currentStep,
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
    );
  }

  Future<void> save() async {
    if (isValid() == false) return;
    final user = ref.read(currentUserProvider);
    await ref.read(userNotifierProvider.notifier).updateUser(user);
  }

  bool isValid() {
    final isValid = formKey.currentState?.validate();
    return isValid ?? false;
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
