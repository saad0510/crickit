import 'package:flutter/material.dart';

import '../../../app/sizer.dart';
import '../../../core/extensions/context_ext.dart';
import '../widgets/available_teams_list.dart';
import 'create_team_screen.dart';

class TeamsScreen extends StatelessWidget {
  const TeamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Teams'),
        titleTextStyle: Theme.of(context).textTheme.titleMedium,
      ),
      body: const AvailableTeamsList(),
      bottomSheet: const Divider(height: 0),
      bottomNavigationBar: Padding(
        padding: AppPaddings.normal,
        child: ElevatedButton(
          onPressed: () => context.pushScreen(const CreateTeamScreen()),
          child: const Text('Create Team'),
        ),
      ),
    );
  }
}
