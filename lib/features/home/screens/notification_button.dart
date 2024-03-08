import 'package:flutter/material.dart';

import '../../../app/sizer.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          child: Material(
            color: Colors.grey.withOpacity(0.08),
            child: InkWell(
              onTap: () {},
              child: SizedBox(
                width: 43.sp,
                height: 43.sp,
                child: const Center(
                  child: Icon(
                    Icons.notifications,
                    size: 23,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: -5,
          right: -5,
          child: CircleAvatar(
            radius: 10.sp,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            child: Text(
              '3',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
