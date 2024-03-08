import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../teams/widgets/user_teams_list.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: AppPaddings.normal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'My Teams',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            AppSizes.smallY,
            const UserTeamsList(),
          ],
        ),
      ),
    );
  }
}
