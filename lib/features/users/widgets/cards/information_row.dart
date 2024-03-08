import 'package:flutter/material.dart';

import '../../../../app/sizer.dart';

class InformationRow extends StatelessWidget {
  const InformationRow({
    super.key,
    required this.title,
    required this.value,
  });

  const InformationRow.text(this.value, {super.key}) : title = '';

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.primary,
    );

    return Container(
      padding: AppPaddings.small,
      margin: EdgeInsets.symmetric(vertical: 2.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(
          width: 0.5,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: style,
            textAlign: TextAlign.left,
          ),
          if (title.isNotEmpty) AppSizes.smallX,
          Expanded(
            child: Text(
              value,
              style: style,
              textAlign: title.isNotEmpty ? TextAlign.right : TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
