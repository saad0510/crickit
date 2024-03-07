import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../app/sizer.dart';
import 'shimmer_bar.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        children: [
          const Expanded(
            flex: 5,
            child: ShimmerBar(),
          ),
          AppSizes.largeY,
          const Row(
            children: [
              Expanded(
                child: ShimmerBar(),
              ),
              Spacer(),
            ],
          ),
          AppSizes.normalY,
          const ShimmerBar(),
          AppSizes.smallY,
          const ShimmerBar(),
          AppSizes.largeY,
          const Expanded(
            child: ShimmerBar(),
          ),
        ],
      ),
    );
  }
}
