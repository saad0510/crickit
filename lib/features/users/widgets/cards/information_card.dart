import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/sizer.dart';
import '../../controllers/current_user_provider.dart';

class InformationCard extends ConsumerWidget {
  const InformationCard({
    super.key,
    required this.title,
    this.children = const [],
    this.expanded = false,
    this.onOpened,
  });

  final String title;
  final List<Widget> children;
  final bool expanded;
  final VoidCallback? onOpened;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onOpened = ref.watch(hideSensitiveInfo) ? null : this.onOpened;

    return ExpansionTile(
      tilePadding: AppPaddings.smallX.copyWith(
        right: onOpened == null ? null : 0,
      ),
      initiallyExpanded: expanded,
      title: Text(
        title,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      controlAffinity: ListTileControlAffinity.leading,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (onOpened != null)
            IconButton(
              onPressed: onOpened,
              icon: Icon(Icons.menu, size: 20.sp),
            ),
        ],
      ),
      children: children,
    );
  }
}
