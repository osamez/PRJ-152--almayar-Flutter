import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/network/result.dart';
import 'package:almeyar/features/home/data/models/branch_details_model.dart';
import 'package:almeyar/features/home/data/models/branches_response_model.dart';
import 'package:almeyar/features/home/data/models/prohibited_model.dart';

abstract class HomeRepo {
  Future<Result<ProhibitedModel>> getProhibitedSea();
  Future<Result<ProhibitedModel>> getProhibitedAir();
  Future<Result<BaseResponse<BranchesResponseModel>>> getAllBranches({
    String? search,
    String? shipmentType,
  });
  Future<Result<BaseResponse<BranchDetailsModel>>> showBranch(int id);
}
