part of '../../feature_imports.dart';

enum PickupRequestStatus {
  received,
  rejected,
  pending;

  String get label {
    switch (this) {
      case PickupRequestStatus.received:
        return LocaleKeys.pickup_requests_status_received.tr();
      case PickupRequestStatus.rejected:
        return LocaleKeys.pickup_requests_status_rejected.tr();
      case PickupRequestStatus.pending:
        return LocaleKeys.pickup_requests_status_pending.tr();
    }
  }

  Color get color {
    switch (this) {
      case PickupRequestStatus.received:
        return AppColors.green;
      case PickupRequestStatus.rejected:
        return AppColors.orange;
      case PickupRequestStatus.pending:
        return const Color(0xffF59E0B);
    }
  }

  Color get backgroundColor {
    switch (this) {
      case PickupRequestStatus.received:
        return AppColors.green.withValues(alpha: 0.1);
      case PickupRequestStatus.rejected:
        return AppColors.orange.withValues(alpha: 0.1);
      case PickupRequestStatus.pending:
        return const Color(0xffF59E0B).withValues(alpha: 0.1);
    }
  }
}
