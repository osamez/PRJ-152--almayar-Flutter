import 'package:almeyar/core/models/app_branch_model.dart';
import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/models/shipment_category_model.dart';
import 'package:almeyar/core/models/shipment_content_model.dart';
import 'package:almeyar/features/price_calculator/data/api_service/price_calculator_api_service.dart';
import 'package:almeyar/features/price_calculator/data/datasources/price_calculator_datasource.dart';
import 'package:almeyar/features/price_calculator/data/models/price_calculator_request_model.dart';
import 'package:almeyar/features/price_calculator/data/models/price_calculator_response_model.dart';

class PriceCalculatorDataSourceImpl implements PriceCalculatorDataSource {
  final PriceCalculatorApiService _apiService;

  const PriceCalculatorDataSourceImpl(this._apiService);

  @override
  Future<BaseResponse<PriceCalculatorResponseModel>> calculateShipmentPrice(
    PriceCalculatorRequestModel request,
  ) async {
    return await _apiService.calculateShipmentPrice(request);
  }

  @override
  Future<BaseResponse<List<ShipmentContentModel>>> getShipmentContents() async {
    return await _apiService.getShipmentContents();
  }

  @override
  Future<BaseResponse<List<ShipmentCategoryModel>>>
  getShipmentCategories() async {
    return await _apiService.getShipmentCategories();
  }

  @override
  Future<BaseResponse<List<AppBranchModel>>> getReceivingBranches() async {
    return await _apiService.getReceivingBranches();
  }

  @override
  Future<BaseResponse<List<AppBranchModel>>> getDeliveryBranches() async {
    return await _apiService.getDeliveryBranches();
  }
}
