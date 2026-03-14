import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/features/home/data/api_service/home_api_service.dart';
import 'package:almeyar/features/home/data/datasource/home_datasource.dart';
import 'package:almeyar/features/home/data/models/branch_details_model.dart';
import 'package:almeyar/features/home/data/models/branch_model.dart';
import 'package:almeyar/features/home/data/models/prohibited_model.dart';

class HomeDataSourceImpl implements HomeDataSource {
  final HomeApiService _apiService;

  const HomeDataSourceImpl(this._apiService);

  @override
  Future<ProhibitedModel> getProhibitedSea() {
    return _apiService.getProhibitedSea();
  }

  @override
  Future<ProhibitedModel> getProhibitedAir() {
    return _apiService.getProhibitedAir();
  }

  @override
  Future<BaseResponse<List<BranchModel>>> getAllBranches(
    String? search,
    int? shippingWay,
  ) {
    return _apiService.getAllBranches(search, shippingWay);
  }

  @override
  Future<BaseResponse<BranchDetailsModel>> showBranch(int id) {
    return _apiService.showBranch(id);
  }
}
