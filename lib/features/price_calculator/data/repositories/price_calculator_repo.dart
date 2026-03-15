import 'package:almeyar/core/models/app_branch_model.dart';
import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/models/shipment_category_model.dart';
import 'package:almeyar/core/models/shipment_content_model.dart';
import 'package:almeyar/core/network/result.dart';
import 'package:almeyar/features/price_calculator/data/models/price_calculator_request_model.dart';
import 'package:almeyar/features/price_calculator/data/models/price_calculator_response_model.dart';

abstract class PriceCalculatorRepo {
  Future<Result<BaseResponse<PriceCalculatorResponseModel>>> calculateShipmentPrice(
    PriceCalculatorRequestModel request,
  );

  Future<Result<BaseResponse<List<ShipmentContentModel>>>> getShipmentContents();

  Future<Result<BaseResponse<List<ShipmentCategoryModel>>>>
  getShipmentCategories();

  Future<Result<BaseResponse<List<AppBranchModel>>>> getReceivingBranches();

  Future<Result<BaseResponse<List<AppBranchModel>>>> getDeliveryBranches();
}
