import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/network/api_constants.dart';
import 'package:almeyar/features/home/data/models/branch_details_model.dart';
import 'package:almeyar/features/home/data/models/branches_response_model.dart';
import 'package:almeyar/features/home/data/models/prohibited_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_service.g.dart';

@RestApi()
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String baseUrl}) = _HomeApiService;

  @GET(ApiConstants.prohibitedSea)
  Future<ProhibitedModel> getProhibitedSea();

  @GET(ApiConstants.prohibitedAir)
  Future<ProhibitedModel> getProhibitedAir();

  @GET(ApiConstants.allBranches)
  Future<BaseResponse<BranchesResponseModel>> getAllBranches(
    @Query('search') String? search,
    @Query('shipment_type') String? shipmentType,
  );

  @GET(ApiConstants.showBranch)
  Future<BaseResponse<BranchDetailsModel>> showBranch(@Path('id') int id);
}
