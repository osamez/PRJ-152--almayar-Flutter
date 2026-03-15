import 'package:almeyar/core/network/result.dart';
import 'package:almeyar/core/models/app_branch_model.dart';
import 'package:almeyar/features/pickup_request/data/models/shipment_category_model.dart';
import 'package:almeyar/features/pickup_request/data/models/shipment_content_model.dart';
import 'package:almeyar/features/pickup_request/data/models/shipment_request_model.dart';

abstract class PickupRequestRepository {
  Future<Result<ShipmentRequestsDataModel>> getShipmentRequests({
    String? trackingNumber,
    String? status,
    String? shipmentType,
    String? flightType,
    String? shippingMethod,
    String? shipmentWay,
    int? page,
  });

  Future<Result<List<ShipmentContentModel>>> getShipmentContents();

  Future<Result<List<ShipmentCategoryModel>>> getShipmentCategories();

  Future<Result<List<AppBranchModel>>> getReceivingBranches();

  Future<Result<List<AppBranchModel>>> getDeliveryBranches();
}
