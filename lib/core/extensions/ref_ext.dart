import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

extension CacheStateRef on AutoDisposeRef {
  void cacheState({required Duration duration}) {
    Timer? timer;
    final link = keepAlive();

    onCancel(() => timer = Timer(duration, link.close));

    onResume(() => timer?.cancel());

    onDispose(() => timer?.cancel());
  }
}
