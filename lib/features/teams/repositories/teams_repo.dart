import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/database_endpoints.dart';
import '../entities/team.dart';

class TeamsRepo {
  final DatabaseEndpoints endpoints;

  const TeamsRepo({
    required this.endpoints,
  });

  Future<void> createTeam(Team team) async {
    final doc = endpoints.teamsRef.doc();
    team = team.copyWith(teamId: doc.id);
    await doc.set(team);
  }

  Future<void> putTeam(Team team) async {
    await endpoints.teamsRef.doc(team.teamId).set(team);
  }

  Future<Team> getTeam(String id) async {
    final data = await endpoints.teamsRef.doc(id).get();
    return data.data()!;
  }

  Stream<List<Team>> getAllTeams() {
    final stream = endpoints.teamsRef.snapshots();
    return stream.map((snap) => snap.docs.map((doc) => doc.data()).toList());
  }
}

final teamsRepoProvider = Provider(
  (ref) => TeamsRepo(
    endpoints: ref.watch(databaseEndpointsProvider),
  ),
);
