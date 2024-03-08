import 'package:flutter/material.dart';

import '../../../app/sizer.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
    this.child,
    this.onEdit,
    this.top,
    this.bottom,
    this.left,
    this.right,
  });

  const EditButton.topRight({
    super.key,
    this.child,
    this.onEdit,
    this.bottom,
    this.left,
  })  : top = 10,
        right = 10;

  final Widget? child;
  final double? top, bottom, left, right;
  final void Function()? onEdit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        if (child != null) Positioned.fill(child: child!),
        Positioned(
          top: top?.sp,
          right: right?.sp,
          left: left?.sp,
          bottom: bottom?.sp,
          child: ClipOval(
            child: SizedBox(
              width: 30.sp,
              height: 30.sp,
              child: ColoredBox(
                color: Colors.black,
                child: IconButton(
                  onPressed: onEdit,
                  color: Colors.white,
                  iconSize: 20.sp,
                  icon: const Icon(Icons.edit),
                  style: IconButton.styleFrom(padding: EdgeInsets.zero),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
