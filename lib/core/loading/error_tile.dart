import 'package:flutter/material.dart';

import '../../app/sizer.dart';

class ErrorTile extends StatelessWidget {
  const ErrorTile(this.error, {super.key});

  final dynamic error;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.small,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.errorContainer,
        border: Border.all(color: Colors.red, width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: SelectableText(
        error.toString(),
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
