import 'package:almeyar/features/auth/data/api_service/auth_api_service.dart';
import 'package:almeyar/features/auth/data/datasources/auth_datasource.dart';
import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/features/auth/data/models/receiving_branch_model.dart';
import 'package:almeyar/features/auth/data/models/login_request.dart';
import 'package:almeyar/features/auth/data/models/login_response.dart';
import 'package:almeyar/features/auth/data/models/send_otp_request.dart';
import 'package:almeyar/features/auth/data/models/verify_otp_request.dart';
import 'package:almeyar/core/models/message_model.dart';
import 'package:almeyar/features/auth/data/models/reset_password_request.dart';
import 'package:almeyar/features/auth/data/models/register_request.dart';
import 'package:almeyar/features/auth/data/models/country_locations_response.dart';

class AuthDataSourceImpl implements AuthDataSource {
  final AuthApiService _apiService;

  const AuthDataSourceImpl(this._apiService);

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    return await _apiService.login(request);
  }

  @override
  Future<MessageModel> register(RegisterRequest request) async {
    return await _apiService.register(
      name: request.name,
      email: request.email,
      branchId: request.branchId,
      countryId: request.countryId,
      password: request.password,
      passwordConfirmation: request.passwordConfirmation,
      phone: request.phone,
      whatsappPhone: request.whatsappPhone,
      notes: request.notes,
      phoneKey: request.phoneKey,
      whatsappKey: request.whatsappKey,
      cityId: request.cityId,
      regionId: request.regionId,
      nationalIdentityPhoto: request.nationalIdentityPhoto,
    );
  }

  @override
  Future<MessageModel> sendOtp(SendOtpRequest request) async {
    return await _apiService.sendOtp(request);
  }

  @override
  Future<MessageModel> verifyOtp(VerifyOtpRequest request) async {
    return await _apiService.verifyOtp(request);
  }

  @override
  Future<MessageModel> resetPassword(ResetPasswordRequest request) async {
    return await _apiService.resetPassword(request);
  }

  @override
  Future<BaseResponse<List<ReceivingBranchModel>>> getReceivingBranches() async {
    return await _apiService.getReceivingBranches();
  }

  @override
  Future<CountryLocationsResponse> getCountryLocations() async {
    return await _apiService.getCountryLocations();
  }
}
