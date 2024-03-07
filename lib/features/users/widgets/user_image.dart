import 'package:flutter/material.dart';

import '../../../app/sizer.dart';

class UserImage extends StatelessWidget {
  const UserImage(
    this.url, {
    super.key,
    this.radius = 80,
    this.userId,
  });

  final String url;
  final String? userId;
  final double radius;

  @override
  Widget build(BuildContext context) {
    late Widget child;

    if (url.isEmpty) {
      child = SizedBox.square(
        dimension: radius.sp,
        child: Icon(
          Icons.account_circle,
          size: radius.sp,
        ),
      );
    } else {
      child = ClipOval(
        child: SizedBox.square(
          dimension: radius.sp,
          child: Image.network(
            url,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
      );
    }

    if (userId != null) {
      child = Hero(tag: userId!, child: child);
    }

    return child;
  }
}
