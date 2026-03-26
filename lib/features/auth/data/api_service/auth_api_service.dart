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
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_service.g.dart';

@RestApi()
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequest request);

  @POST(ApiConstants.register)
  @MultiPart()
  Future<MessageModel> register({
    @Part() required String? name,
    @Part() required String? email,
    @Part(name: 'branch_id') required String? branchId,
    @Part(name: 'country_id') required String? countryId,
    @Part() required String? password,
    @Part(name: 'password_confirmation') required String? passwordConfirmation,
    @Part() required String? phone,
    @Part(name: 'whatsapp_phone') required String? whatsappPhone,
    @Part() required String? notes,
    @Part(name: 'phone_key') required String? phoneKey,
    @Part(name: 'whatsapp_key') required String? whatsappKey,
    @Part(name: 'city_id') required int? cityId,
    @Part(name: 'region_id') required int? regionId,
    @Part(name: 'national_identity_photo') required File? nationalIdentityPhoto,
  });

  @POST(ApiConstants.sendOtp)
  Future<MessageModel> sendOtp(@Body() SendOtpRequest request);

  @POST(ApiConstants.verifyOtp)
  Future<MessageModel> verifyOtp(@Body() VerifyOtpRequest request);

  @POST(ApiConstants.forgotPassword)
  Future<MessageModel> resetPassword(@Body() ResetPasswordRequest request);

  @GET(ApiConstants.deliveryBranches)
  Future<BaseResponse<List<ReceivingBranchModel>>> getReceivingBranches();

  @GET(ApiConstants.countryLocations)
  Future<CountryLocationsResponse> getCountryLocations();
}
