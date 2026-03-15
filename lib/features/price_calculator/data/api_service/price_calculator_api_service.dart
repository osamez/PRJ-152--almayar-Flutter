import 'package:almeyar/core/models/app_branch_model.dart';
import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/models/shipment_category_model.dart';
import 'package:almeyar/core/models/shipment_content_model.dart';
import 'package:almeyar/core/network/api_constants.dart';
import 'package:almeyar/features/price_calculator/data/models/price_calculator_request_model.dart';
import 'package:almeyar/features/price_calculator/data/models/price_calculator_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'price_calculator_api_service.g.dart';

@RestApi()
abstract class PriceCalculatorApiService {
  factory PriceCalculatorApiService(Dio dio, {String baseUrl}) =
      _PriceCalculatorApiService;

  @POST(ApiConstants.calculateShipmentPrice)
  Future<BaseResponse<PriceCalculatorResponseModel>> calculateShipmentPrice(
    @Body() PriceCalculatorRequestModel request,
  );

  @GET(ApiConstants.shipmentContents)
  Future<BaseResponse<List<ShipmentContentModel>>> getShipmentContents();

  @GET(ApiConstants.shipmentCategories)
  Future<BaseResponse<List<ShipmentCategoryModel>>> getShipmentCategories();

  @GET(ApiConstants.receivingBranches)
  Future<BaseResponse<List<AppBranchModel>>> getReceivingBranches();

  @GET(ApiConstants.deliveryBranches)
  Future<BaseResponse<List<AppBranchModel>>> getDeliveryBranches();
}
