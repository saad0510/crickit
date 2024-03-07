import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../app/sizer.dart';
import '../../auth/controllers/user_provider.dart';
import 'edit_button.dart';
import 'image_picker_button.dart';

class UserImagePicker extends ConsumerStatefulWidget {
  const UserImagePicker({
    super.key,
    this.radius = 100,
    required this.onChanged,
  });

  final double radius;
  final void Function(Uint8List bytes) onChanged;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends ConsumerState<UserImagePicker> {
  Uint8List? bytes;

  @override
  Widget build(BuildContext context) {
    final imageUrl = ref.watch(userProvider.select((u) => u.detail.imageUrl));

    void propagateChange(Uint8List? b) {
      if (b == null) return;
      setState(() {
        bytes = b;
        widget.onChanged(b);
      });
    }

    if (bytes != null) {
      return SizedBox.square(
        dimension: widget.radius.sp,
        child: EditButton(
          bottom: 0,
          right: 10,
          onEdit: () => setState(() => bytes = null),
          child: ClipOval(
            child: Image.memory(
              bytes!,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
      );
    }

    if (imageUrl.isNotEmpty) {
      return SizedBox.square(
        dimension: widget.radius.sp,
        child: EditButton(
          bottom: 0,
          right: 10,
          onEdit: () async {
            final xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
            if (xfile == null) return;
            propagateChange(await xfile.readAsBytes());
          },
          child: ClipOval(
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
      );
    }

    return ImagePickerButton(
      rounded: true,
      radius: widget.radius,
      onPicked: propagateChange,
    );
  }
}
