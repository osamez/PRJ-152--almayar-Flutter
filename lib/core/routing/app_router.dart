import 'package:almeyar/core/routing/routes.dart';
import 'package:almeyar/features/auth/presentation/feature_imports.dart';
import 'package:almeyar/features/onboarding/presentation/feature_imports.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: Routes.register,
  routes: [
    GoRoute(
      path: Routes.onboarding,
      name: Routes.onboarding,
      builder: (context, state) => const OnBoardingView(),
    ),
    GoRoute(
      path: Routes.login,
      name: Routes.login,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: Routes.register,
      name: Routes.register,
      builder: (context, state) => const RegisterView(),
    ),
  ],
);
