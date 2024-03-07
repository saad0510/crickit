import 'package:flutter/material.dart';

import '../../../app/assets.dart';
import '../../../app/sizer.dart';

class MainTitle extends StatelessWidget {
  const MainTitle(
    this.text, {
    super.key,
    this.subtitle,
    this.showLogo = false,
  });

  final String text;
  final String? subtitle;
  final bool showLogo;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge //
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            if (showLogo) ...[
              AppSizes.smallX,
              Image.asset(
                AppImages.appLogo,
                width: 0.17.dw,
              ),
            ],
          ],
        ),
        if (subtitle != null) ...[
          AppSizes.smallY,
          Text(
            subtitle!,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ],
    );
  }
}
