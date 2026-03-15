import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/network/api_constants.dart';
import 'package:almeyar/core/models/app_branch_model.dart';
import 'package:almeyar/features/pickup_request/data/models/shipment_category_model.dart';
import 'package:almeyar/features/pickup_request/data/models/shipment_content_model.dart';
import 'package:almeyar/features/pickup_request/data/models/shipment_request_model.dart';
import 'package:almeyar/features/pickup_request/data/models/add_shipment_request_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'pickup_request_api_service.g.dart';

@RestApi()
abstract class PickupRequestApiService {
  factory PickupRequestApiService(Dio dio, {String baseUrl}) =
      _PickupRequestApiService;

  @GET(ApiConstants.shipmentRequests)
  Future<BaseResponse<ShipmentRequestsDataModel>> getShipmentRequests({
    @Query('tracking_number') String? trackingNumber,
    @Query('status') String? status,
    @Query('shipment_type') String? shipmentType,
    @Query('flight_type') String? flightType,
    @Query('shipping_method') String? shippingMethod,
    @Query('shipment_way') String? shipmentWay,
    @Query('page') int? page,
  });

  @GET(ApiConstants.shipmentContents)
  Future<BaseResponse<List<ShipmentContentModel>>> getShipmentContents();

  @GET(ApiConstants.shipmentCategories)
  Future<BaseResponse<List<ShipmentCategoryModel>>> getShipmentCategories();

  @GET(ApiConstants.receivingBranches)
  Future<BaseResponse<List<AppBranchModel>>> getReceivingBranches();

  @GET(ApiConstants.deliveryBranches)
  Future<BaseResponse<List<AppBranchModel>>> getDeliveryBranches();

  @POST(ApiConstants.addShipmentRequest)
  @MultiPart()
  Future<BaseResponse<AddShipmentRequestResponseData>> addShipmentRequest({
    @Part(name: 'receiving_branch_id') required String receivingBranchId,
    @Part(name: 'delivery_branch_id') required String deliveryBranchId,
    @Part(name: 'boxes_count') required String boxesCount,
    @Part(name: 'total_weight') required String totalWeight,
    @Part(name: 'shipment_content_id') required String shipmentContentId,
    @Part(name: 'shipment_type') required String shipmentType,
    @Part(name: 'flight_type') required String flightType,
    @Part(name: 'total_size') required String totalSize,
    @Part(name: 'category_id') required String categoryId,
    @Part(name: 'tracking_number') required String trackingNumber,
    @Part(name: 'supplier_phone_code') required String supplierPhoneCode,
    @Part(name: 'supplier_phone') required String supplierPhone,
    @Part(name: 'inspection_request') required String inspectionRequest,
    @Part(name: 'inspection_note') String? inspectionNote,
    @Part(name: 'document_images[]') List<MultipartFile>? documentImages,
    @Part(name: 'shipment_images[]') List<MultipartFile>? shipmentImages,
  });
}
