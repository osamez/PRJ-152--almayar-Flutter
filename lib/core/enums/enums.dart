import 'package:almeyar/core/utils/exports.dart';

enum ProhibitedType { sea, air }

enum AppInfoType { privacyPolicy, aboutApp, termsAndConditions }

enum PurchaseStatus {
  pending(4),
  inProgress(36),
  purchased(35),
  cancelled(11);

  final int id;
  const PurchaseStatus(this.id);

  String get label {
    switch (this) {
      case PurchaseStatus.pending:
        return LocaleKeys.pickup_requests_status_pending.tr();
      case PurchaseStatus.inProgress:
        return LocaleKeys.purchase_orders_in_progress.tr();
      case PurchaseStatus.purchased:
        return LocaleKeys.purchase_orders_purchased.tr();
      case PurchaseStatus.cancelled:
        return LocaleKeys.shipment_tracking_cancelled.tr();
    }
  }

  Color get color {
    switch (this) {
      case PurchaseStatus.pending:
        return AppColors.yellow;
      case PurchaseStatus.inProgress:
        return AppColors.deepViolet;
      case PurchaseStatus.purchased:
        return AppColors.green;
      case PurchaseStatus.cancelled:
        return AppColors.orange;
    }
  }
}
