import 'package:flutter/material.dart';

import '../../../app/assets.dart';
import '../../../app/sizer.dart';

class ReviewProfileScreen extends StatelessWidget {
  const ReviewProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppImages.review,
              height: 250.h,
              cacheHeight: 800,
            ),
            AppSizes.largeY,
            Text(
              'Review your information carefully and\nclick save to complete your profile',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
