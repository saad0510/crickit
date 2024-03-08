import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/current_user_provider.dart';
import 'user_detail_screen.dart';

class OtherUserDetailScreen extends ConsumerStatefulWidget {
  const OtherUserDetailScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OtherUserDetailScreenState();
}

class _OtherUserDetailScreenState extends ConsumerState<OtherUserDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        hideSensitiveInfo.overrideWithValue(true),
      ],
      child: const Scaffold(
        body: UserDetailScreen(),
      ),
    );
  }
}
