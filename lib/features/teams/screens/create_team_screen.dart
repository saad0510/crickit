import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../../core/extensions/context_ext.dart';
import '../../../core/loading/loading_elevated_button.dart';
import '../../auth/controllers/user_provider.dart';
import '../../auth/widgets/app_text_field.dart';
import '../entities/team.dart';
import '../entities/team_constraints.dart';
import '../entities/team_member.dart';
import '../entities/team_position.dart';
import '../entities/team_role.dart';
import '../repositories/teams_repo.dart';

class CreateTeamScreen extends ConsumerStatefulWidget {
  const CreateTeamScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateTeamScreenState();
}

class _CreateTeamScreenState extends ConsumerState<CreateTeamScreen> {
  final formKey = GlobalKey<FormState>();

  late var team = Team(
    teamId: '',
    title: '',
    description: '',
    constraints: const TeamConstraints.zero(),
    members: [
      TeamMember(
        uid: ref.watch(userIdProvider),
        position: TeamPosition.captain,
        role: TeamRole.allRounder,
        battingOrder: DateTime.now().millisecondsSinceEpoch,
        bowlingOrder: DateTime.now().millisecondsSinceEpoch,
        joinedAt: DateTime.now(),
      ),
    ],
    createdBy: ref.watch(userIdProvider),
    createdAt: DateTime.now(),
  );

  set newTeam(Team newTeam) {
    team = newTeam;
  }

  set newConstraints(TeamConstraints constraints) {
    team = team.copyWith(constraints: constraints);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Team'),
      ),
      body: SingleChildScrollView(
        padding: AppPaddings.normal,
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppTextField.name(
                label: 'Title',
                hint: 'The title of team',
                initialValue: team.title,
                onSubmit: (x) => newTeam = team.copyWith(title: x),
              ),
              AppSizes.smallY,
              AppTextField.name(
                label: 'Description',
                hint: 'A brief description of team',
                initialValue: team.description,
                onSubmit: (x) => newTeam = team.copyWith(description: x),
              ),
              AppSizes.smallY,
              AppTextField.integer(
                label: 'Players Count',
                hint: 'Maximum number of members allowed',
                initialValue: team.constraints.maxPlayers.toString(),
                onSubmit: (x) => newConstraints = team.constraints.copyWith(maxPlayers: int.parse(x)),
              ),
              AppSizes.smallY,
              AppTextField.integer(
                label: 'Batsmen Count',
                hint: 'Maximum number of batsmen allowed',
                initialValue: team.constraints.maxBatsmen.toString(),
                onSubmit: (x) => newConstraints = team.constraints.copyWith(maxBatsmen: int.parse(x)),
              ),
              AppSizes.smallY,
              AppTextField.integer(
                label: 'Bowlers Count',
                hint: 'Maximum number of bowlers allowed',
                initialValue: team.constraints.maxBowlers.toString(),
                onSubmit: (x) => newConstraints = team.constraints.copyWith(maxBowlers: int.parse(x)),
              ),
              AppSizes.smallY,
              AppTextField.integer(
                label: 'Wicket Keepers Count',
                hint: 'Maximum number of wicket keepers allowed',
                initialValue: team.constraints.maxWicketKeepers.toString(),
                onSubmit: (x) => newConstraints = team.constraints.copyWith(maxWicketKeepers: int.parse(x)),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: const Divider(height: 0),
      bottomNavigationBar: Padding(
        padding: AppPaddings.normal,
        child: LoadingElevatedButton(
          onPressed: submit,
          child: const Text('Create'),
        ),
      ),
    );
  }

  Future<void> submit() async {
    final isValid = formKey.currentState?.validate() ?? false;
    if (isValid == false) return;
    formKey.currentState?.save();
    await ref.read(teamsRepoProvider).createTeam(team);
    if (mounted) context.pop();
  }
}
