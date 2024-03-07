import 'package:flutter/material.dart';

import '../../app/sizer.dart';
import '../extensions/context_ext.dart';

class LoadingElevatedButton extends StatefulWidget {
  const LoadingElevatedButton({
    super.key,
    required this.child,
    required this.onPressed,
  });

  final Widget child;
  final Future<void> Function()? onPressed;

  @override
  State<LoadingElevatedButton> createState() => _LoadingElevatedButtonState();
}

class _LoadingElevatedButtonState extends State<LoadingElevatedButton> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    if (loading)
      return ElevatedButton(
        onPressed: () {},
        child: SizedBox.square(
          dimension: 25.sp,
          child: const CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 2,
          ),
        ),
      );

    void load() async {
      try {
        setState(() => loading = true);
        await widget.onPressed!();
      } catch (e, s) {
        if (mounted) //
          context.showError(e, s);
      } finally {
        if (mounted) //
          setState(() => loading = false);
      }
    }

    return ElevatedButton(
      onPressed: widget.onPressed == null ? null : load,
      child: widget.child,
    );
  }
}
