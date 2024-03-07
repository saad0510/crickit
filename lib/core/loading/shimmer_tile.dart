import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../app/sizer.dart';
import 'shimmer_bar.dart';

class ShimmerTile extends StatelessWidget {
  const ShimmerTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListTile(
        contentPadding: AppPaddings.smallX,
        leading: CircleAvatar(radius: 25.sp),
        title: const Row(
          children: [
            Expanded(
              child: ShimmerBar.small(),
            ),
            Spacer(),
            Spacer(),
          ],
        ),
        subtitle: const Row(
          children: [
            Expanded(
              flex: 2,
              child: ShimmerBar.small(),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
