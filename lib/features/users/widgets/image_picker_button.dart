import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../app/sizer.dart';

class ImagePickerButton extends StatelessWidget {
  const ImagePickerButton({
    super.key,
    this.cameraOnly = false,
    this.rounded = false,
    this.radius = 100,
    required this.onPicked,
  });

  final bool cameraOnly;
  final bool rounded;
  final double radius;
  final void Function(Uint8List file) onPicked;

  @override
  Widget build(BuildContext context) {
    final borderRadius = rounded //
        ? const BorderRadius.all(Radius.circular(100))
        : const BorderRadius.all(Radius.circular(12));

    return ClipRRect(
      borderRadius: borderRadius,
      child: Container(
        width: radius.sp,
        height: radius.sp,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey, width: 1.5),
          borderRadius: borderRadius,
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () async {
              final xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
              if (xfile == null) return;
              onPicked(await xfile.readAsBytes());
            },
            child: Icon(
              Icons.add,
              size: 30.sp,
              color: Colors.blueGrey,
            ),
          ),
        ),
      ),
    );
  }
}
