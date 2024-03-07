import 'package:flutter/material.dart';

import '../../../app/assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
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
