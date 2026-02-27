import 'package:almeyar/core/routing/routes.dart';
import 'package:almeyar/features/auth/presentation/feature_imports.dart';
import 'package:almeyar/features/home/presentation/feature_imports.dart';
import 'package:almeyar/features/main/presentation/features_imports.dart';
import 'package:almeyar/features/onboarding/presentation/feature_imports.dart';
import 'package:almeyar/features/pickup_request/presentation/feature_imports.dart';
import 'package:almeyar/features/price_calculator/presentation/feature_imports.dart';
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
    GoRoute(
      path: Routes.shipmentAddressDetails,
      name: Routes.shipmentAddressDetails,
      builder: (context, state) => const ShipmentAddressDetailsView(),
    ),
    GoRoute(
      path: Routes.requestReceiveShipmentView,
      name: Routes.requestReceiveShipmentView,
      builder: (context, state) => const RequestReceiveShipmentView(),
    ),
    GoRoute(
      path: Routes.receiveShipment,
      name: Routes.receiveShipment,
      builder: (context, state) {
        final shipmentType = state.extra as ShipmentType;
        return ReceiveShipmentView(shipmentType: shipmentType);
      },
    ),
    GoRoute(
      path: Routes.shipmentPickupRequests,
      name: Routes.shipmentPickupRequests,
      builder: (context, state) => const ShipmentPickupRequestsView(),
    ),
    GoRoute(
      path: Routes.shipmentPickupDetails,
      name: Routes.shipmentPickupDetails,
      builder: (context, state) => const ShipmentPickupDetailsView(),
    ),
    GoRoute(
      path: Routes.priceCalculator,
      name: Routes.priceCalculator,
      builder: (context, state) => const PriceCalculatorView(),
    ),
  ],
);
