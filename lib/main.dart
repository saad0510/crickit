import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/constants.dart';
import 'app/routes.dart';
import 'app/theme/theme.dart';
import 'core/utils/app_logger.dart';
import 'features/auth/controllers/route_provider.dart';
import 'features/auth/screens/splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      observers: [AppLogger()],
      child: Consumer(
        builder: (context, ref, _) {
          final initialRoute = ref.watch(routeProvider);

          if (!initialRoute.isReloading && initialRoute.isLoading) {
            return const MaterialApp(
              key: ValueKey('splash'),
              debugShowCheckedModeBanner: false,
              title: AppConstants.appTitle,
              home: SplashScreen(),
            );
          }

          final brightness = ref.watch(themeModeProvider);

          return MaterialApp(
            key: ValueKey(initialRoute.requireValue),
            debugShowCheckedModeBanner: false,
            title: AppConstants.appTitle,
            theme: AppTheme().withBrightness(brightness),
            initialRoute: initialRoute.requireValue.name,
            onGenerateRoute: AppRoutes.onGenerateRoute,
          );
        },
      ),
    );
  }
}
