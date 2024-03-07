import 'package:flutter/material.dart';

import '../../../app/sizer.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    super.key,
    required this.count,
    required this.child,
  });

  final int count;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final countStr = count > 9 ? '+9' : count.toString();

    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        if (count > 0)
          Positioned(
            top: -5,
            right: 0,
            child: CircleAvatar(
              radius: 8.sp,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              child: Text(
                countStr,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
