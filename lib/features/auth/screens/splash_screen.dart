import 'package:flutter/material.dart';

import '../../../app/assets.dart';
import '../../../app/theme/colors.dart';
import '../../../app/theme/ui_overlays.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: AppUiOverlays.primaryOverlay,
      ),
      body: Center(
        child: Image.asset(
          AppImages.appLogo,
          fit: BoxFit.fitWidth,
          width: MediaQuery.of(context).size.width * 0.5,
        ),
      ),
    );
  }
}
