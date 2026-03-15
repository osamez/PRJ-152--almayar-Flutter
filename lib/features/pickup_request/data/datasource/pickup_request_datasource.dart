import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/models/app_branch_model.dart';
import 'package:almeyar/core/models/shipment_category_model.dart';
import 'package:almeyar/core/models/shipment_content_model.dart';
import 'package:almeyar/features/pickup_request/data/models/shipment_request_model.dart';

import 'package:almeyar/features/pickup_request/data/models/add_shipment_request_response_model.dart';
import 'package:dio/dio.dart';

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

  Future<BaseResponse<AddShipmentRequestResponseData>> addShipmentRequest({
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
