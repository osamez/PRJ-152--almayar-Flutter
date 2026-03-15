import 'package:almeyar/core/models/app_branch_model.dart';
import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/models/shipment_category_model.dart';
import 'package:almeyar/core/models/shipment_content_model.dart';
import 'package:almeyar/features/price_calculator/data/models/price_calculator_request_model.dart';
import 'package:almeyar/features/price_calculator/data/models/price_calculator_response_model.dart';

abstract class PriceCalculatorDataSource {
  Future<BaseResponse<PriceCalculatorResponseModel>> calculateShipmentPrice(
    PriceCalculatorRequestModel request,
  );

  Future<BaseResponse<List<ShipmentContentModel>>> getShipmentContents();

  Future<BaseResponse<List<ShipmentCategoryModel>>> getShipmentCategories();

  Future<BaseResponse<List<AppBranchModel>>> getReceivingBranches();

  Future<BaseResponse<List<AppBranchModel>>> getDeliveryBranches();
}
