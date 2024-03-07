import 'package:flutter/material.dart';

import '../features/auth/screens/complete_profile_screen.dart';
import '../features/auth/screens/email_verification_screen.dart';
import '../features/auth/screens/login_screen.dart';
import '../features/auth/screens/signup_screen.dart';
import '../features/auth/screens/splash_screen.dart';
import '../features/home/screens/navigation_screen.dart';
import '../features/users/screens/settings_screen.dart';
import '../features/users/screens/user_detail_screen.dart';

enum AppRoutes {
  splash,
  login,
  signup,
  emailVerification,
  completeProfile,
  home,
  userDetail,
  settings,
  ;

  static const initial = splash;

  static Route<dynamic> onGenerateRoute(RouteSettings route) {
    final appRoute = values.byName(route.name!);

    switch (appRoute) {
      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case signup:
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
        );

      case emailVerification:
        return MaterialPageRoute(
          builder: (_) => const EmailVerificationScreen(),
        );
      case completeProfile:
        return MaterialPageRoute(
          builder: (_) => const CompleteProfileScreen(),
        );
      case home:
        return MaterialPageRoute(
          builder: (_) => const NavigationScreen(),
        );
      case userDetail:
        return MaterialPageRoute(
          builder: (_) => const UserDetailScreen(),
        );

      case settings:
        return MaterialPageRoute(
          builder: (_) => const SettingsScreen(),
        );
    }
  }
}
