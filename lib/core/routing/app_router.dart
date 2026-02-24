import 'package:almeyar/core/routing/routes.dart';
import 'package:almeyar/features/auth/presentation/feature_imports.dart';
import 'package:almeyar/features/home/presentation/feature_imports.dart';
import 'package:almeyar/features/main/presentation/features_imports.dart';
import 'package:almeyar/features/onboarding/presentation/feature_imports.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: Routes.login,
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
    GoRoute(
      path: Routes.forgetPassword,
      name: Routes.forgetPassword,
      builder: (context, state) => const ForgetPasswordView(),
    ),
    GoRoute(
      path: Routes.otp,
      name: Routes.otp,
      builder: (context, state) => const OtpView(),
    ),
    GoRoute(
      path: Routes.resetPassword,
      name: Routes.resetPassword,
      builder: (context, state) => const ResetPasswordView(),
    ),
    GoRoute(
      path: Routes.main,
      name: Routes.main,
      builder: (context, state) => const MainView(),
    ),
    GoRoute(
      path: Routes.shipmentAddresses,
      name: Routes.shipmentAddresses,
      builder: (context, state) => const ShipmentsAddressesView(),
    ),
  ],
);
