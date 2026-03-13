import 'package:almeyar/core/network/api_constants.dart';
import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/models/message_model.dart';
import 'package:almeyar/features/auth/data/models/receiving_branch_model.dart';
import 'package:almeyar/features/auth/data/models/login_request.dart';
import 'package:almeyar/features/auth/data/models/login_response.dart';
import 'package:almeyar/features/auth/data/models/send_otp_request.dart';
import 'package:almeyar/features/auth/data/models/verify_otp_request.dart';
import 'package:almeyar/features/auth/data/models/reset_password_request.dart';
import 'package:almeyar/features/auth/data/models/country_locations_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_service.g.dart';

@RestApi()
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequest request);

  @POST(ApiConstants.sendOtp)
  Future<MessageModel> sendOtp(@Body() SendOtpRequest request);

  @POST(ApiConstants.verifyOtp)
  Future<MessageModel> verifyOtp(@Body() VerifyOtpRequest request);

  @POST(ApiConstants.forgotPassword)
  Future<MessageModel> resetPassword(@Body() ResetPasswordRequest request);

  @POST(ApiConstants.receivingBranches)
  Future<BaseResponse<List<ReceivingBranchModel>>> getReceivingBranches();

  @GET(ApiConstants.countryLocations)
  Future<CountryLocationsResponse> getCountryLocations();
}
