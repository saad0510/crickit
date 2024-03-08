import 'package:flutter/material.dart';

import '../../../app/sizer.dart';

class MainTitle extends StatelessWidget {
  const MainTitle(
    this.text, {
    super.key,
    this.subtitle,
  });

  final String text;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleLarge,
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
