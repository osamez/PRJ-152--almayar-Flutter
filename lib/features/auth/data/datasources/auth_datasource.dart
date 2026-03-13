import 'package:almeyar/features/auth/data/models/login_request.dart';
import 'package:almeyar/features/auth/data/models/login_response.dart';
import 'package:almeyar/features/auth/data/models/receiving_branch_model.dart';
import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/features/auth/data/models/send_otp_request.dart';
import 'package:almeyar/features/auth/data/models/verify_otp_request.dart';
import 'package:almeyar/core/models/message_model.dart';
import 'package:almeyar/features/auth/data/models/reset_password_request.dart';
import 'package:almeyar/features/auth/data/models/register_request.dart';
import 'package:almeyar/features/auth/data/models/country_locations_response.dart';

abstract class AuthDataSource {
  Future<LoginResponse> login(LoginRequest request);
  Future<MessageModel> register(RegisterRequest request);
  Future<MessageModel> sendOtp(SendOtpRequest request);
  Future<MessageModel> verifyOtp(VerifyOtpRequest request);
  Future<MessageModel> resetPassword(ResetPasswordRequest request);
  Future<BaseResponse<List<ReceivingBranchModel>>> getReceivingBranches();
  Future<CountryLocationsResponse> getCountryLocations();
}
