import 'dart:math';

import 'package:flutter/material.dart';

import '../../../app/sizer.dart';

class SendIcon extends StatelessWidget {
  const SendIcon({
    super.key,
    this.color,
    this.size,
  });

  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 4,
      origin: const Offset(-3, -3),
      child: Icon(
        Icons.send_rounded,
        size: size?.sp,
        color: color,
      ),
    );
  }
}
