import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'error_tile.dart';

class LoadingWidget<T> extends StatelessWidget {
  const LoadingWidget({
    super.key,
    required this.value,
    required this.builder,
    this.loader = const Center(
      child: CircularProgressIndicator(),
    ),
  });

  final AsyncValue<T> value;
  final Widget Function(T data) builder;
  final Widget loader;

  @override
  Widget build(BuildContext context) {
    if (value.isLoading) {
      return loader;
    }
    if (value.hasError) {
      log(
        value.error.toString(),
        stackTrace: value.stackTrace,
      );
      return ErrorTile(value.error);
    }
    return builder(
      value.requireValue,
    );
  }
}
