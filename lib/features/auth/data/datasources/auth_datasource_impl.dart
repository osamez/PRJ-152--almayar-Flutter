import 'package:almeyar/features/auth/data/api_service/auth_api_service.dart';
import 'package:almeyar/features/auth/data/datasources/auth_datasource.dart';
import 'package:almeyar/features/auth/data/models/login_request.dart';
import 'package:almeyar/features/auth/data/models/login_response.dart';
import 'package:almeyar/features/auth/data/models/send_otp_request.dart';
import 'package:almeyar/core/models/message_model.dart';

class AuthDataSourceImpl implements AuthDataSource {
  final AuthApiService _apiService;

  const AuthDataSourceImpl(this._apiService);

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    return await _apiService.login(request);
  }

  @override
  Future<MessageModel> sendOtp(SendOtpRequest request) async {
    return await _apiService.sendOtp(request);
  }
}
