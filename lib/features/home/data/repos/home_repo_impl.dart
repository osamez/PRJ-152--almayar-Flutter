import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/network/result.dart';
import 'package:almeyar/core/utils/app_logger.dart';
import 'package:almeyar/features/home/data/datasource/home_datasource.dart';
import 'package:almeyar/features/home/data/models/branch_details_model.dart';
import 'package:almeyar/features/home/data/models/branch_model.dart';
import 'package:almeyar/features/home/data/models/prohibited_model.dart';
import 'package:almeyar/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeDataSource _dataSource;

  const HomeRepoImpl(this._dataSource);

  @override
  Future<Result<ProhibitedModel>> getProhibitedSea() async {
    try {
      final response = await _dataSource.getProhibitedSea();
      AppLogger.info('HomeRepoImpl - getProhibitedSea: Success');
      return Result.success(response);
    } catch (e, stackTrace) {
      AppLogger.error('HomeRepoImpl - getProhibitedSea: Error', e, stackTrace);
      return Result.failure(e, stackTrace);
    }
  }

  @override
  Future<Result<ProhibitedModel>> getProhibitedAir() async {
    try {
      final response = await _dataSource.getProhibitedAir();
      AppLogger.info('HomeRepoImpl - getProhibitedAir: Success');
      return Result.success(response);
    } catch (e, stackTrace) {
      AppLogger.error('HomeRepoImpl - getProhibitedAir: Error', e, stackTrace);
      return Result.failure(e, stackTrace);
    }
  }

  @override
  Future<Result<BaseResponse<List<BranchModel>>>> getAllBranches({
    String? search,
    int? shippingWay,
  }) async {
    try {
      final response = await _dataSource.getAllBranches(search, shippingWay);
      AppLogger.info('HomeRepoImpl - getAllBranches: Success');
      return Result.success(response);
    } catch (e, stackTrace) {
      AppLogger.error('HomeRepoImpl - getAllBranches: Error', e, stackTrace);
      return Result.failure(e, stackTrace);
    }
  }

  @override
  Future<Result<BaseResponse<BranchDetailsModel>>> showBranch(int id) async {
    try {
      final response = await _dataSource.showBranch(id);
      AppLogger.info('HomeRepoImpl - showBranch: Success');
      return Result.success(response);
    } catch (e, stackTrace) {
      AppLogger.error('HomeRepoImpl - showBranch: Error', e, stackTrace);
      return Result.failure(e, stackTrace);
    }
  }
}
