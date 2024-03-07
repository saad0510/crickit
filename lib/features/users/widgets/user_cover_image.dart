import 'package:flutter/material.dart';

import '../../../app/sizer.dart';
import '../../../core/extensions/context_ext.dart';
import '../screens/gallery_scroll_screen.dart';

class UserCoverImage extends StatelessWidget {
  const UserCoverImage(
    this.url, {
    super.key,
    this.height = double.infinity,
    this.userId,
    this.allowZoom = false,
  });

  final String url;
  final String? userId;
  final double height;
  final bool allowZoom;

  @override
  Widget build(BuildContext context) {
    late Widget child;

    if (url.isEmpty) {
      child = SizedBox(
        height: height.h,
        child: Container(
          color: Colors.black87,
          height: height.h,
          child: Icon(
            Icons.person,
            size: 100.sp,
            color: Colors.white,
          ),
        ),
      );
    } else {
      child = SizedBox(
        height: height.h,
        child: Image.network(
          url,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      );
    }

    if (userId != null) {
      child = Hero(
        tag: userId!,
        child: child,
      );
    }

    if (allowZoom && url.isNotEmpty) {
      child = Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(child: child),
          Positioned(
            right: 10.sp,
            bottom: 10.sp,
            child: ColoredBox(
              color: Colors.black26,
              child: IconButton(
                onPressed: () async {
                  context.pushScreen(
                    GalleryScrollScreen(
                      initialIndex: 0,
                      title: 'User Image',
                      images: [NetworkImage(url)],
                      heroTags: userId == null ? null : [userId!],
                    ),
                  );
                },
                iconSize: 30.sp,
                color: Colors.white,
                icon: const Icon(Icons.fullscreen),
                style: IconButton.styleFrom(
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ),
          ),
        ],
      );
    }

    return child;
  }
}
