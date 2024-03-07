import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../app/sizer.dart';
import 'shimmer_bar.dart';

class ShimmerMessage extends StatelessWidget {
  const ShimmerMessage.right({super.key}) : alignLeft = false;

  const ShimmerMessage.left({super.key}) : alignLeft = true;

  final bool alignLeft;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: alignLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.5,
            child: const ShimmerBar(),
          ),
          AppSizes.tinyY,
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.3,
            child: const ShimmerBar(),
          ),
        ],
      ),
    );
  }
}
