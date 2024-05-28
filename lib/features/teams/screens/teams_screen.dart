import 'package:flutter/material.dart';

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
        title: const Text('Join Teams'),
        titleTextStyle: Theme.of(context).textTheme.titleMedium,
      ),
      body: const AvailableTeamsList(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => context.pushScreen(const CreateTeamScreen()),
      ),
    );
  }
}
