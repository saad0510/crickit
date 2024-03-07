import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../app/sizer.dart';

class ShimmerBar extends StatelessWidget {
  const ShimmerBar({super.key}) : height = 20;

  const ShimmerBar.small({super.key}) : height = 10;

  const ShimmerBar.large({super.key}) : height = 150;

  final double height;

  Shimmer animating() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.sp,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}
