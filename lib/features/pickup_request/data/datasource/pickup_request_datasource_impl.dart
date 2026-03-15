import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/features/pickup_request/data/api_service/pickup_request_api_service.dart';
import 'package:almeyar/core/models/app_branch_model.dart';
import 'package:almeyar/core/models/shipment_category_model.dart';
import 'package:almeyar/core/models/shipment_content_model.dart';
import 'package:almeyar/features/pickup_request/data/models/shipment_request_model.dart';
import 'package:almeyar/features/pickup_request/data/models/add_shipment_request_response_model.dart';
import 'package:dio/dio.dart';
import 'pickup_request_datasource.dart';

class PickupRequestDataSourceImpl implements PickupRequestDataSource {
  final PickupRequestApiService _apiService;

  PickupRequestDataSourceImpl(this._apiService);

  @override
  Future<BaseResponse<ShipmentRequestsDataModel>> getShipmentRequests({
    String? trackingNumber,
    String? status,
    String? shipmentType,
    String? flightType,
    String? shippingMethod,
    String? shipmentWay,
    int? page,
  }) {
    return _apiService.getShipmentRequests(
      trackingNumber: trackingNumber,
      status: status,
      shipmentType: shipmentType,
      flightType: flightType,
      shippingMethod: shippingMethod,
      shipmentWay: shipmentWay,
      page: page,
    );
  }

  @override
  Future<BaseResponse<List<ShipmentContentModel>>> getShipmentContents() {
    return _apiService.getShipmentContents();
  }

  @override
  Future<BaseResponse<List<ShipmentCategoryModel>>> getShipmentCategories() {
    return _apiService.getShipmentCategories();
  }

  @override
  Future<BaseResponse<List<AppBranchModel>>> getReceivingBranches() {
    return _apiService.getReceivingBranches();
  }

  @override
  Future<BaseResponse<List<AppBranchModel>>> getDeliveryBranches() {
    return _apiService.getDeliveryBranches();
  }

  @override
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
  }) {
    return _apiService.addShipmentRequest(
      receivingBranchId: receivingBranchId,
      deliveryBranchId: deliveryBranchId,
      boxesCount: boxesCount,
      totalWeight: totalWeight,
      shipmentContentId: shipmentContentId,
      shipmentType: shipmentType,
      flightType: flightType,
      totalSize: totalSize,
      categoryId: categoryId,
      trackingNumber: trackingNumber,
      supplierPhoneCode: supplierPhoneCode,
      supplierPhone: supplierPhone,
      inspectionRequest: inspectionRequest,
      inspectionNote: inspectionNote,
      documentImages: documentImages,
      shipmentImages: shipmentImages,
    );
  }
}
