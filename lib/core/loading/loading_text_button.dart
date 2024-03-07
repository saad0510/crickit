import 'package:flutter/material.dart';

import '../../app/sizer.dart';
import '../../app/theme/colors.dart';
import '../extensions/context_ext.dart';

class LoadingTextButton extends StatefulWidget {
  const LoadingTextButton({
    super.key,
    required this.child,
    required this.onPressed,
  });

  final Widget child;
  final Future<void> Function() onPressed;

  @override
  State<LoadingTextButton> createState() => _LoadingElevaTextnState();
}

class _LoadingElevaTextnState extends State<LoadingTextButton> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    if (loading)
      return TextButton(
        onPressed: () {},
        child: SizedBox.square(
          dimension: 25.sp,
          child: const CircularProgressIndicator(
            color: AppColors.primary,
            strokeWidth: 2,
          ),
        ),
      );

    return TextButton(
      onPressed: () async {
        try {
          setState(() => loading = true);
          await widget.onPressed();
        } catch (e, s) {
          if (mounted) //
            context.showError(e, s);
        } finally {
          if (mounted) //
            setState(() => loading = false);
        }
      },
      child: widget.child,
    );
  }
}
