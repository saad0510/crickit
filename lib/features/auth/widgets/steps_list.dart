import 'package:flutter/material.dart';

import '../../../app/sizer.dart';
import '../../../app/theme/colors.dart';

class StepsList extends StatelessWidget {
  const StepsList({
    super.key,
    required this.active,
    required this.count,
  });

  final int active;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: List.generate(
        count,
        (i) => Container(
          width: 12.sp,
          height: 12.sp,
          margin: AppPaddings.tiny,
          child: active >= i //
              ? const CircleAvatar(backgroundColor: AppColors.primary)
              : const CircleAvatar(),
        ),
      ),
    );
  }
}
