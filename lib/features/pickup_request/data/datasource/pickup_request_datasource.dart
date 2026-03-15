import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/models/app_branch_model.dart';
import 'package:almeyar/features/pickup_request/data/models/shipment_category_model.dart';
import 'package:almeyar/features/pickup_request/data/models/shipment_content_model.dart';
import 'package:almeyar/features/pickup_request/data/models/shipment_request_model.dart';

abstract class PickupRequestDataSource {
  Future<BaseResponse<ShipmentRequestsDataModel>> getShipmentRequests({
    String? trackingNumber,
    String? status,
    String? shipmentType,
    String? flightType,
    String? shippingMethod,
    String? shipmentWay,
    int? page,
  });

  Future<BaseResponse<List<ShipmentContentModel>>> getShipmentContents();

  Future<BaseResponse<List<ShipmentCategoryModel>>> getShipmentCategories();

  Future<BaseResponse<List<AppBranchModel>>> getReceivingBranches();

  Future<BaseResponse<List<AppBranchModel>>> getDeliveryBranches();
}
