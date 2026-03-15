import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/network/result.dart';
import 'package:almeyar/core/models/app_branch_model.dart';
import 'package:almeyar/core/models/shipment_category_model.dart';
import 'package:almeyar/core/models/shipment_content_model.dart';
import 'package:almeyar/features/pickup_request/data/models/shipment_request_model.dart';

import 'package:almeyar/features/pickup_request/data/models/add_shipment_request_response_model.dart';
import 'package:dio/dio.dart';

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

  Future<Result<BaseResponse<AddShipmentRequestResponseData>>>
  addShipmentRequest({
    required String receivingBranchId,
    required String deliveryBranchId,
    required String boxesCount,
    required String totalWeight,
    required String shipmentContentId,
    required String shipmentType,
    required String flightType,
    required String totalSize,
    required String categoryId,
    required String trackingNumber,
    required String supplierPhoneCode,
    required String supplierPhone,
    required String inspectionRequest,
    String? inspectionNote,
    List<MultipartFile>? documentImages,
    List<MultipartFile>? shipmentImages,
  });
}
