import 'package:almeyar/features/auth/data/models/login_request.dart';
import 'package:almeyar/features/auth/data/models/login_response.dart';
import 'package:almeyar/features/auth/data/models/send_otp_request.dart';
import 'package:almeyar/features/auth/data/models/verify_otp_request.dart';
import 'package:almeyar/core/models/message_model.dart';
import 'package:almeyar/features/auth/data/models/reset_password_request.dart';

abstract class AuthDataSource {
  Future<LoginResponse> login(LoginRequest request);
  Future<MessageModel> sendOtp(SendOtpRequest request);
  Future<MessageModel> verifyOtp(VerifyOtpRequest request);
  Future<MessageModel> resetPassword(ResetPasswordRequest request);
}
