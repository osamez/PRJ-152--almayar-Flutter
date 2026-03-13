import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/features/home/data/models/branch_model.dart';
import 'package:almeyar/features/home/data/models/prohibited_model.dart';

abstract class HomeDataSource {
  Future<ProhibitedModel> getProhibitedSea();
  Future<ProhibitedModel> getProhibitedAir();
  Future<BaseResponse<List<BranchModel>>> getAllBranches(
    String? search,
    int? shippingWay,
  );
}
