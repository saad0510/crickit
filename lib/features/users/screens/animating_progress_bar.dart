import 'package:flutter/material.dart';

import '../../../app/sizer.dart';

class AnimatingProgressBar extends StatelessWidget {
  const AnimatingProgressBar(this.progress, {super.key});

  final double? progress;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: SizedBox(
        height: 8.h,
        child: TweenAnimationBuilder<double>(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 500),
          tween: Tween(begin: 0, end: progress),
          builder: (_, x, __) => LinearProgressIndicator(value: x),
        ),
      ),
    );
  }
}
