import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:procom/features/auth/controllers/user_notifier.dart';

import '../../../app/sizer.dart';
import '../../auth/controllers/user_provider.dart';
import 'edit_button.dart';
import 'user_image.dart';

class UserImagePicker extends ConsumerStatefulWidget {
  const UserImagePicker({
    super.key,
    this.radius = 100,
  });

  final double radius;

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
      setState(() => bytes = b);
      ref.watch(userNotifierProvider.notifier).changeProfilePic(bytes!);
    }

    void pickImage() async {
      final xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (xfile == null) return;
      propagateChange(await xfile.readAsBytes());
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
          onEdit: pickImage,
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

    return Stack(
      children: [
        const UserImage(
          '',
          radius: 90,
        ),
        Positioned(
          bottom: -8.sp,
          right: -8.sp,
          child: IconButton(
            onPressed: pickImage,
            icon: const Icon(Icons.add_circle),
          ),
        ),
      ],
    );
  }
}
