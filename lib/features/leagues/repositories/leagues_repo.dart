import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/database_endpoints.dart';
import '../entities/league.dart';

class LeaguesRepo {
  final DatabaseEndpoints endpoints;

  const LeaguesRepo({
    required this.endpoints,
  });

  Future<void> createLeague(League league) async {
    final doc = endpoints.leaguesRef.doc();
    league = league.copyWith(id: doc.id);
    await doc.set(league);
  }

  Future<void> putLeague(League leagure) async {
    await endpoints.leaguesRef.doc(leagure.id).set(leagure);
  }

  Stream<List<League>> getAllLeagues() {
    final stream = endpoints.leaguesRef.snapshots();
    return stream.map((snap) => snap.docs.map((doc) => doc.data()).toList());
  }
}

final leaguesRepoProvider = Provider(
  (ref) => LeaguesRepo(
    endpoints: ref.watch(databaseEndpointsProvider),
  ),
);
