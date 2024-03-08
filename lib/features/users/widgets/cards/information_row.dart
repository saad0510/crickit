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
    return Container(
      padding: AppPaddings.small,
      margin: EdgeInsets.symmetric(vertical: 2.sp),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.left,
          ),
          if (title.isNotEmpty) AppSizes.smallX,
          Expanded(
            child: Text(
              value,
              textAlign: title.isNotEmpty ? TextAlign.right : TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
