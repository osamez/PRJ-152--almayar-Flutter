import 'package:almeyar/core/models/app_branch_model.dart';
import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/models/shipment_category_model.dart';
import 'package:almeyar/core/models/shipment_content_model.dart';
import 'package:almeyar/core/network/result.dart';
import 'package:almeyar/core/utils/app_logger.dart';
import 'package:almeyar/features/price_calculator/data/datasources/price_calculator_datasource.dart';
import 'package:almeyar/features/price_calculator/data/models/price_calculator_request_model.dart';
import 'package:almeyar/features/price_calculator/data/models/price_calculator_response_model.dart';
import 'package:almeyar/features/price_calculator/data/repositories/price_calculator_repo.dart';

class PriceCalculatorRepoImpl implements PriceCalculatorRepo {
  final PriceCalculatorDataSource _dataSource;

  const PriceCalculatorRepoImpl(this._dataSource);

  @override
  Future<Result<BaseResponse<PriceCalculatorResponseModel>>> calculateShipmentPrice(
    PriceCalculatorRequestModel request,
  ) async {
    try {
      final response = await _dataSource.calculateShipmentPrice(request);
      AppLogger.info('PriceCalculatorRepoImpl - calculateShipmentPrice: Success');
      return Result.success(response);
    } catch (e, stackTrace) {
      AppLogger.error(
        'PriceCalculatorRepoImpl - calculateShipmentPrice: Error',
        e,
        stackTrace,
      );
      return Result.failure(e, stackTrace);
    }
  }

  @override
  Future<Result<BaseResponse<List<ShipmentContentModel>>>>
  getShipmentContents() async {
    try {
      final response = await _dataSource.getShipmentContents();
      AppLogger.info('PriceCalculatorRepoImpl - getShipmentContents: Success');
      return Result.success(response);
    } catch (e, stackTrace) {
      AppLogger.error(
        'PriceCalculatorRepoImpl - getShipmentContents: Error',
        e,
        stackTrace,
      );
      return Result.failure(e, stackTrace);
    }
  }

  @override
  Future<Result<BaseResponse<List<ShipmentCategoryModel>>>>
  getShipmentCategories() async {
    try {
      final response = await _dataSource.getShipmentCategories();
      AppLogger.info('PriceCalculatorRepoImpl - getShipmentCategories: Success');
      return Result.success(response);
    } catch (e, stackTrace) {
      AppLogger.error(
        'PriceCalculatorRepoImpl - getShipmentCategories: Error',
        e,
        stackTrace,
      );
      return Result.failure(e, stackTrace);
    }
  }

  @override
  Future<Result<BaseResponse<List<AppBranchModel>>>>
  getReceivingBranches() async {
    try {
      final response = await _dataSource.getReceivingBranches();
      AppLogger.info('PriceCalculatorRepoImpl - getReceivingBranches: Success');
      return Result.success(response);
    } catch (e, stackTrace) {
      AppLogger.error(
        'PriceCalculatorRepoImpl - getReceivingBranches: Error',
        e,
        stackTrace,
      );
      return Result.failure(e, stackTrace);
    }
  }

  @override
  Future<Result<BaseResponse<List<AppBranchModel>>>>
  getDeliveryBranches() async {
    try {
      final response = await _dataSource.getDeliveryBranches();
      AppLogger.info('PriceCalculatorRepoImpl - getDeliveryBranches: Success');
      return Result.success(response);
    } catch (e, stackTrace) {
      AppLogger.error(
        'PriceCalculatorRepoImpl - getDeliveryBranches: Error',
        e,
        stackTrace,
      );
      return Result.failure(e, stackTrace);
    }
  }
}
