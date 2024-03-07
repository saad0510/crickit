import 'dart:developer' show log;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/routes.dart';
import '../utils/error_screen.dart';

extension NavExtOnContext on BuildContext {
  void pushScreen(Widget screen, {List<Override> overrides = const []}) {
    Navigator.of(this).push(
      MaterialPageRoute(
        builder: (_) => ProviderScope(
          overrides: overrides,
          parent: ProviderScope.containerOf(this),
          child: screen,
        ),
      ),
    );
  }

  void push(AppRoutes appRoute) {
    Navigator.of(this).pushNamed(appRoute.name);
  }

  void replace(AppRoutes appRoute) {
    Navigator.of(this).pushReplacementNamed(appRoute.name);
  }

  void replaceAll(AppRoutes appRoute) {
    final navigator = Navigator.of(this);
    while (navigator.canPop()) {
      navigator.pop();
    }
    navigator.pushReplacementNamed(appRoute.name);
  }

  bool canPop() {
    return Navigator.of(this).canPop();
  }

  void pop([dynamic result]) {
    Navigator.of(this).pop(result);
  }

  void popTillFirst() {
    Navigator.of(this).popUntil((route) => route.isFirst);
  }

  void openDialog(
    Widget dialog, {
    List<Override> overrides = const [],
    bool popOnSuccess = false,
  }) async {
    final x = await showDialog(
      context: this,
      builder: (_) => ProviderScope(
        parent: ProviderScope.containerOf(this),
        overrides: overrides,
        child: dialog,
      ),
    );
    if (popOnSuccess && x == true && mounted) popTillFirst();
  }
}

extension WidgetsExtOnContext on BuildContext {
  void showSnackBar({
    required String message,
    Color backgroundColor = Colors.black,
    Color foregroundColor = Colors.white,
  }) {
    ScaffoldMessenger.of(this)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message, style: TextStyle(color: foregroundColor)),
          behavior: SnackBarBehavior.floating,
          backgroundColor: backgroundColor,
        ),
      );
  }

  dynamic showError(dynamic error, [dynamic stackTrace]) {
    if (error == null && stackTrace == null) return;
    if (error == 'ignore') return;

    log(error.toString(), stackTrace: stackTrace);
    return showModalBottomSheet(
      context: this,
      builder: (context) => ErrorScreen(error: error),
    );
  }

  void showLoading() {
    showDialog(
      context: this,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  void showLoadingUntil<T>(
    Future<T> future, {
    Function(T)? then,
    bool dismissible = false,
  }) {
    bool dismissed = false;

    var hook = Future.value(future);
    hook = hook.whenComplete(() => dismissed ? null : pop());
    if (then != null) hook = hook.then((x) => then(x));
    hook = hook.catchError(showError);

    showDialog(
      context: this,
      barrierDismissible: dismissible,
      builder: (context) {
        return PopScope(
          canPop: dismissible && !dismissed,
          onPopInvoked: (x) => dismissed = x,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
