import 'package:almeyar/core/network/result.dart';
import 'package:almeyar/features/auth/data/models/login_request.dart';
import 'package:almeyar/features/auth/data/models/login_response.dart';
import 'package:almeyar/features/auth/data/models/send_otp_request.dart';
import 'package:almeyar/features/auth/data/models/verify_otp_request.dart';
import 'package:almeyar/core/models/message_model.dart';

abstract class AuthRepo {
  Future<Result<LoginResponse>> login(LoginRequest request);
  Future<Result<MessageModel>> sendOtp(SendOtpRequest request);
  Future<Result<MessageModel>> verifyOtp(VerifyOtpRequest request);
}
