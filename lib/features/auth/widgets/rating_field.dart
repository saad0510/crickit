import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../app/sizer.dart';

class RatingField extends StatelessWidget {
  const RatingField({
    super.key,
    required this.label,
    this.initial = 1,
    required this.onChanged,
  });

  final String label;
  final int initial;
  final void Function(int x) onChanged;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      shadowColor: Theme.of(context).colorScheme.primary,
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: Container(
          padding: AppPaddings.small,
          color: Theme.of(context).colorScheme.primary,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),
                ),
              ),
              RatingBar.builder(
                initialRating: initial.toDouble(),
                minRating: 1,
                direction: Axis.horizontal,
                itemCount: 5,
                glow: false,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemSize: 30.sp,
                itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
                onRatingUpdate: (rating) => onChanged(rating.toInt()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
