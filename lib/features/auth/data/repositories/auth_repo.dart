import 'package:almeyar/core/network/result.dart';
import 'package:almeyar/features/auth/data/models/register_request.dart';
import 'package:almeyar/features/auth/data/models/login_request.dart';
import 'package:almeyar/features/auth/data/models/login_response.dart';
import 'package:almeyar/features/auth/data/models/receiving_branch_model.dart';
import 'package:almeyar/features/auth/data/models/send_otp_request.dart';
import 'package:almeyar/features/auth/data/models/verify_otp_request.dart';
import 'package:almeyar/core/models/message_model.dart';
import 'package:almeyar/features/auth/data/models/reset_password_request.dart';
import 'package:almeyar/features/auth/data/models/country_locations_response.dart';

abstract class AuthRepo {
  Future<Result<LoginResponse>> login(LoginRequest request);
  Future<Result<MessageModel>> register(RegisterRequest request);
  Future<Result<MessageModel>> sendOtp(SendOtpRequest request);
  Future<Result<MessageModel>> verifyOtp(VerifyOtpRequest request);
  Future<Result<MessageModel>> resetPassword(ResetPasswordRequest request);
  Future<Result<List<ReceivingBranchModel>>> getReceivingBranches();
  Future<Result<CountryLocationsResponse>> getCountryLocations();
}
