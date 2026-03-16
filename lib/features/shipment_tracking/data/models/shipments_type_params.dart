import 'package:almeyar/features/shipment_tracking/data/models/shipment_status_count_model.dart';

class ShipmentsTypeParams {
  final int selectedTabIndex;
  final ShipmentStatusModel? status;

  const ShipmentsTypeParams({
    this.selectedTabIndex = 0,
    this.status,
  });
}
