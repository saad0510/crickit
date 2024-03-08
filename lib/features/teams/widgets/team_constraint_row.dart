import 'package:flutter/material.dart';

class TeamConstraintRow extends StatelessWidget {
  const TeamConstraintRow({
    super.key,
    required this.label,
    required this.active,
  });

  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Checkbox(
            value: active,
            onChanged: (x) {},
          ),
          Expanded(
            child: Text(label),
          ),
        ],
      ),
    );
  }
}
