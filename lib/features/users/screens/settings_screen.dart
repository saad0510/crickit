import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../../core/extensions/context_ext.dart';
import '../../auth/screens/batting_skills_profile_screen.dart';
import '../../auth/screens/bowling_skills_profile_screen.dart';
import '../../auth/screens/cricket_skills_profile_screen.dart';
import '../../auth/screens/education_profile_screen.dart';
import '../../auth/screens/fielding_skills_profile_screen.dart';
import '../../auth/screens/gender_profile_screen.dart';
import '../../auth/screens/residence_profile_screen.dart';
import '../../home/widgets/logout_button.dart';
import 'edit_profile_screen.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListTileTheme(
        data: Theme.of(context).listTileTheme.copyWith(
              tileColor: Colors.grey.shade200,
              subtitleTextStyle: Theme.of(context).textTheme.bodySmall,
            ),
        child: SingleChildScrollView(
          padding: AppPaddings.normal.copyWith(bottom: 0),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _EditProfileTile(
                title: 'About yourself',
                subtitle: 'Edit your gender and bio',
                screen: GenderProfileScreen(),
              ),
              _EditProfileTile(
                title: 'Cricket Skills',
                subtitle: 'Edit general cricket skills and roles',
                screen: CricketSkillsProfileScreen(),
              ),
              _EditProfileTile(
                title: 'Batting Skills',
                subtitle: 'Edit batting skills',
                screen: BattingSkillsProfileScreen(),
              ),
              _EditProfileTile(
                title: 'Bowling Skills',
                subtitle: 'Edit bowling skills',
                screen: BowlingSkillsProfileScreen(),
              ),
              _EditProfileTile(
                title: 'Fielding Skills',
                subtitle: 'Edit fielding skills',
                screen: FieldingSkillsProfileScreen(),
              ),
              _EditProfileTile(
                title: 'Residency',
                subtitle: 'Edit city, country, and addresses',
                screen: ResidenceProfileScreen(),
              ),
              _EditProfileTile(
                title: 'Education',
                subtitle: 'Edit education information and dates',
                screen: EducationProfileScreen(),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: const Divider(height: 0),
      bottomNavigationBar: Padding(
        padding: AppPaddings.small,
        child: const LogoutButton(),
      ),
    );
  }
}

class _EditProfileTile extends StatelessWidget {
  const _EditProfileTile({
    required this.title,
    required this.subtitle,
    required this.screen,
  });

  final String title;
  final String subtitle;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.tinyY,
      child: ListTile(
        onTap: () => context.pushScreen(
          EditProfileScreen(screen: screen),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.keyboard_arrow_right),
      ),
    );
  }
}
