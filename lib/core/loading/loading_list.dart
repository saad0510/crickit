import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/sizer.dart';
import 'error_tile.dart';
import 'shimmer_tile.dart';

class LoadingList<T> extends StatelessWidget {
  const LoadingList({
    super.key,
    required this.value,
    required this.builder,
    this.separator,
    this.loader = const ShimmerTile(),
    this.emptyMessage = 'List is empty',
  }) : scrollable = true;

  const LoadingList.neverScroll({
    super.key,
    required this.value,
    required this.builder,
    this.loader = const ShimmerTile(),
    this.separator,
    this.emptyMessage = 'List is empty',
  }) : scrollable = false;

  final AsyncValue<List<T>> value;
  final Widget Function(T item, int index) builder;
  final Widget loader;
  final Widget? separator;
  final String emptyMessage;
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    final shrinkWrap = !scrollable;
    final physics = scrollable ? const AlwaysScrollableScrollPhysics() : const NeverScrollableScrollPhysics();
    final heightFactor = scrollable ? null : 10.0;

    if (value.isLoading && !value.isReloading) {
      return ListView.builder(
        itemCount: 5,
        shrinkWrap: shrinkWrap,
        physics: physics,
        padding: AppPaddings.small,
        itemBuilder: (_, i) => loader,
      );
    }

    if (value.hasError) {
      return Container(
        alignment: Alignment.topCenter,
        padding: AppPaddings.small,
        child: ErrorTile(value.error),
      );
    }

    final items = value.requireValue;

    if (items.isEmpty) {
      return Center(
        heightFactor: heightFactor,
        child: Text(
          emptyMessage,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      );
    }

    final separator = this.separator ?? AppSizes.smallY;

    return ListView.separated(
      itemCount: items.length,
      shrinkWrap: shrinkWrap,
      physics: physics,
      padding: AppPaddings.small,
      separatorBuilder: (_, i) => separator,
      itemBuilder: (_, i) => builder(items[i], i),
    );
  }
}
