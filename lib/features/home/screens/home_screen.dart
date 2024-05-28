import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../leagues/widgets/available_leagues_list.dart';
import '../../teams/widgets/joined_teams_list.dart';
import 'home_app_bar.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: SingleChildScrollView(
        padding: AppPaddings.normal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppSizes.smallY,
            Text(
              'Leagues',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            AppSizes.smallY,
            const AvailableLeaguesList(),
            AppSizes.largeY,
            Text(
              'My Teams',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            AppSizes.smallY,
            const JoinedTeamsList(),
          ],
        ),
      ),
    );
  }
}
