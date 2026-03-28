part of '../../feature_imports.dart';

enum PickupRequestStatus {
  pickupPoint, // 3
  processing, // 14
  prepared, // 15
  shipping, // 17
  deliveryPoint, // 19
  readyToDeliver, // 20
  cancelled, // 11
  pending,
  received,
  delivered,
  rejected;

  String get label {
    switch (this) {
      case PickupRequestStatus.pickupPoint:
        return LocaleKeys.shipment_tracking_at_pickup_point.tr();
      case PickupRequestStatus.processing:
        return LocaleKeys.shipment_tracking_being_prepared.tr();
      case PickupRequestStatus.prepared:
        return LocaleKeys.shipment_tracking_prepared.tr();
      case PickupRequestStatus.shipping:
        return LocaleKeys.shipment_tracking_being_shipped.tr();
      case PickupRequestStatus.deliveryPoint:
        return LocaleKeys.shipment_tracking_at_delivery_point.tr();
      case PickupRequestStatus.readyToDeliver:
        return LocaleKeys.shipment_tracking_ready_for_delivery.tr();
      case PickupRequestStatus.cancelled:
        return LocaleKeys.shipment_tracking_cancelled.tr();
      case PickupRequestStatus.received:
        return LocaleKeys.pickup_requests_status_received.tr();
      case PickupRequestStatus.rejected:
        return LocaleKeys.pickup_requests_status_rejected.tr();
      case PickupRequestStatus.pending:
        return LocaleKeys.pickup_requests_status_pending.tr();
      case PickupRequestStatus.delivered:
        return 'تم التوصيل';
    }
  }

  Color get color {
    switch (this) {
      case PickupRequestStatus.pickupPoint:
        return AppColors.darkSlate;
      case PickupRequestStatus.processing:
        return AppColors.orange;
      case PickupRequestStatus.prepared:
        return AppColors.deepViolet;
      case PickupRequestStatus.shipping:
        return AppColors.orange;
      case PickupRequestStatus.deliveryPoint:
        return AppColors.deepViolet;
      case PickupRequestStatus.readyToDeliver:
        return AppColors.green;
      case PickupRequestStatus.cancelled:
        return AppColors.orange;
      case PickupRequestStatus.received:
        return AppColors.green;
      case PickupRequestStatus.rejected:
        return AppColors.orange;
      case PickupRequestStatus.pending:
        return const Color(0xffF59E0B);
      case PickupRequestStatus.delivered:
        return AppColors.green;
    }
  }

  Color get backgroundColor {
    switch (this) {
      case PickupRequestStatus.pickupPoint:
        return AppColors.darkSlate.withValues(alpha: 0.1);
      case PickupRequestStatus.processing:
        return AppColors.orange.withValues(alpha: 0.1);
      case PickupRequestStatus.prepared:
        return AppColors.deepViolet.withValues(alpha: 0.1);
      case PickupRequestStatus.shipping:
        return AppColors.orange.withValues(alpha: 0.1);
      case PickupRequestStatus.deliveryPoint:
        return AppColors.deepViolet.withValues(alpha: 0.1);
      case PickupRequestStatus.readyToDeliver:
        return AppColors.green.withValues(alpha: 0.1);
      case PickupRequestStatus.cancelled:
        return AppColors.orange.withValues(alpha: 0.1);
      case PickupRequestStatus.received:
        return AppColors.green.withValues(alpha: 0.1);
      case PickupRequestStatus.rejected:
        return AppColors.orange.withValues(alpha: 0.1);
      case PickupRequestStatus.pending:
        return const Color(0xffF59E0B).withValues(alpha: 0.1);
      case PickupRequestStatus.delivered:
        return AppColors.green.withValues(alpha: 0.1);
    }
  }
}
