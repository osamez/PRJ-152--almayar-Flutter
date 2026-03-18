import 'package:almeyar/core/enums/enums.dart';
import 'package:almeyar/features/auth/presentation/feature_imports.dart';
import 'package:almeyar/features/delivery_requests/data/models/delivery_order_model.dart';
import 'package:almeyar/features/home/presentation/feature_imports.dart';
import 'package:almeyar/features/main/presentation/features_imports.dart';
import 'package:almeyar/features/onboarding/presentation/feature_imports.dart';
import 'package:almeyar/features/pickup_request/data/models/shipment_request_model.dart';
import 'package:almeyar/features/pickup_request/presentation/feature_imports.dart';
import 'package:almeyar/features/price_calculator/presentation/feature_imports.dart';
import 'package:almeyar/features/delivery_requests/presentation/feature_imports.dart';
import 'package:almeyar/features/purchase_orders/data/models/purchase_order_model.dart';
import 'package:almeyar/features/purchase_orders/presentation/feature_imports.dart';
import 'package:almeyar/features/shipment_tracking/data/models/shipment_tracking_model.dart';
import 'package:almeyar/features/shipment_tracking/presentation/feature_imports.dart';
import 'package:almeyar/features/money_transfers/presentation/feature_imports.dart';
import 'package:almeyar/features/profile/presentation/feature_imports.dart';
import 'package:almeyar/features/tickets/presentation/feature_imports.dart';
import 'package:almeyar/features/shipment_tracking/data/models/shipments_type_params.dart';
import 'package:almeyar/features/wallets/presentation/feature_imports.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

String initialRoute = Routes.login;

final router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: initialRoute,
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
      builder: (context, state) {
        return OtpView(otpParams: state.extra as OtpParams);
      },
    ),
    GoRoute(
      path: Routes.resetPassword,
      name: Routes.resetPassword,
      builder: (context, state) {
        return ResetPasswordView(params: state.extra as ResetPasswordParams);
      },
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
      builder: (context, state) {
        final branchId = state.extra as int;
        return ShipmentAddressDetailsView(branchId: branchId);
      },
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
      builder: (context, state) => PickupRequestDetailsView(
        shipmentModel: state.extra as ShipmentRequestModel,
      ),
    ),
    GoRoute(
      path: Routes.priceCalculator,
      name: Routes.priceCalculator,
      builder: (context, state) => const PriceCalculatorView(),
    ),
    GoRoute(
      path: Routes.shipmentsTracking,
      name: Routes.shipmentsTracking,
      builder: (context, state) => const ShipmentsTrackingView(),
    ),
    GoRoute(
      path: Routes.shipmentsType,
      name: Routes.shipmentsType,
      builder: (context, state) =>
          ShipmentsTypeView(params: state.extra as ShipmentsTypeParams?),
    ),

    GoRoute(
      path: Routes.shipmentDetails,
      name: Routes.shipmentDetails,
      builder: (context, state) =>
          ShipmentDetailsView(shipmentModel: state.extra as ShipmentModel),
    ),
    GoRoute(
      path: Routes.deliveryRequests,
      name: Routes.deliveryRequests,
      builder: (context, state) => const DeliveryRequestsView(),
    ),
    GoRoute(
      path: Routes.deliveryRequestsDetails,
      name: Routes.deliveryRequestsDetails,
      builder: (context, state) =>
          DeliveryRequestItemDetailsView(id: state.extra as int),
    ),
    GoRoute(
      path: Routes.shoppingSites,
      name: Routes.shoppingSites,
      builder: (context, state) => const ShoppingSitesView(),
    ),
    GoRoute(
      path: Routes.purchaseOrders,
      name: Routes.purchaseOrders,
      builder: (context, state) => const PurchaseOrdersView(),
    ),
    GoRoute(
      path: Routes.addPurchaseOrder,
      name: Routes.addPurchaseOrder,
      builder: (context, state) => const AddPurchaseOrderView(),
    ),
    GoRoute(
      path: Routes.purchaseOrderDetails,
      name: Routes.purchaseOrderDetails,
      builder: (context, state) =>
          PurchaseOrderDetailsView(order: state.extra as PurchaseOrderModel),
    ),
    GoRoute(
      path: Routes.moneyTransfers,
      name: Routes.moneyTransfers,
      builder: (context, state) => const MoneyTransfersView(),
    ),
    GoRoute(
      path: Routes.addNewMoneyTransfer,
      name: Routes.addNewMoneyTransfer,
      builder: (context, state) => const AddNewMoneyTransferView(),
    ),
    GoRoute(
      path: Routes.moneyTransferDetails,
      name: Routes.moneyTransferDetails,
      builder: (context, state) => const MoneyTransferDetailsView(),
    ),
    GoRoute(
      path: Routes.profile,
      name: Routes.profile,
      builder: (context, state) => const ProfileView(),
    ),
    GoRoute(
      path: Routes.editProfile,
      name: Routes.editProfile,
      builder: (context, state) => const EditProfileView(),
    ),
    GoRoute(
      path: Routes.changePassword,
      name: Routes.changePassword,
      builder: (context, state) => const ChangePasswordView(),
    ),
    GoRoute(
      path: Routes.termsAndConditions,
      name: Routes.termsAndConditions,
      builder: (context, state) => const TermsAndConditionsView(),
    ),
    GoRoute(
      path: Routes.giftCards,
      name: Routes.giftCards,
      builder: (context, state) => const GiftCardsView(),
    ),
    GoRoute(
      path: Routes.supportTickets,
      name: Routes.supportTickets,
      builder: (context, state) => const SupportTicketsView(),
    ),
    GoRoute(
      path: Routes.addNewTicket,
      name: Routes.addNewTicket,
      builder: (context, state) => const AddNewTicketView(),
    ),
    GoRoute(
      path: Routes.ticketDetails,
      name: Routes.ticketDetails,
      builder: (context, state) => const TicketDetailsView(),
    ),
    GoRoute(
      path: Routes.wallets,
      name: Routes.wallets,
      builder: (context, state) => const WalletsView(),
    ),
    GoRoute(
      path: Routes.walletMoneyTransfer,
      name: Routes.walletMoneyTransfer,
      builder: (context, state) => const WalletMoneyTransferView(),
    ),
    GoRoute(
      path: Routes.accountStatement,
      name: Routes.accountStatement,
      builder: (context, state) => const AccountStatementView(),
    ),
    GoRoute(
      path: Routes.prohibited,
      name: Routes.prohibited,
      builder: (context, state) {
        final type = state.extra as ProhibitedType;
        return ProhibitedView(type: type);
      },
    ),
  ],
);
