import 'package:flutter/material.dart';

import '../../../app/assets.dart';
import '../../../app/sizer.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.appLogo,
      width: 80.sp,
      height: 40.sp,
      alignment: Alignment.centerLeft,
      fit: BoxFit.fitHeight,
    );
  }
}
