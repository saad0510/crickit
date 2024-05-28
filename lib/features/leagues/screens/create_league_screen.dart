import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/sizer.dart';
import '../../../core/extensions/context_ext.dart';
import '../../../core/loading/loading_elevated_button.dart';
import '../../auth/controllers/user_provider.dart';
import '../../auth/widgets/app_text_field.dart';
import '../../teams/controllers/current_team_provider.dart';
import '../entities/league.dart';
import '../entities/league_team.dart';
import '../repositories/leagues_repo.dart';

class CreateLeagueScreen extends ConsumerStatefulWidget {
  const CreateLeagueScreen({
    super.key,
    this.editWith,
  });

  final League? editWith;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateLeagueScreenState();
}

class _CreateLeagueScreenState extends ConsumerState<CreateLeagueScreen> {
  final formKey = GlobalKey<FormState>();

  late final allowEdit = widget.editWith != null;
  late var league = widget.editWith ??
      League(
        id: '',
        title: '',
        description: '',
        createdBy: ref.watch(userIdProvider),
        createdAt: DateTime.now(),
        maxMatches: 2,
        maxTeams: 2,
        teams: [
          LeagueTeam(
            teamId: ref.watch(currentTeamProvider).teamId,
            joinedAt: DateTime.now(),
          ),
        ],
        matches: const [],
      );

  set newLeague(League newLeague) {
    league = newLeague;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: allowEdit ? const Text('Edit League') : const Text('Create League'),
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
                hint: 'The title of league',
                initialValue: league.title,
                onSubmit: (x) => newLeague = league.copyWith(title: x),
              ),
              AppSizes.smallY,
              AppTextField.name(
                label: 'Description',
                hint: 'A brief description of league',
                initialValue: league.description,
                onSubmit: (x) => newLeague = league.copyWith(description: x),
              ),
              AppSizes.smallY,
              AppTextField.integer(
                label: 'Teams Count',
                hint: 'Maximum number of teams allowed',
                initialValue: league.maxTeams.toString(),
                onSubmit: (x) => newLeague = league.copyWith(maxTeams: int.parse(x)),
              ),
              AppSizes.smallY,
              AppTextField.integer(
                label: 'Matches Count',
                hint: 'Maximum number of matches allowed',
                initialValue: league.maxMatches.toString(),
                onSubmit: (x) => newLeague = league.copyWith(maxMatches: int.parse(x)),
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
          child: allowEdit ? const Text('Edit') : const Text('Create'),
        ),
      ),
    );
  }

  Future<void> submit() async {
    final isValid = formKey.currentState?.validate() ?? false;
    if (isValid == false) return;
    formKey.currentState?.save();

    if (allowEdit)
      await ref.read(leaguesRepoProvider).putLeague(league);
    else
      await ref.read(leaguesRepoProvider).createLeague(league);

    if (mounted) context.popTillFirst();
  }
}
