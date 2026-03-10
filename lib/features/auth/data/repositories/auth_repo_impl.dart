import 'package:almeyar/core/network/result.dart';
import 'package:almeyar/core/utils/app_logger.dart';
import 'package:almeyar/features/auth/data/datasources/auth_datasource.dart';
import 'package:almeyar/features/auth/data/models/login_request.dart';
import 'package:almeyar/features/auth/data/models/login_response.dart';
import 'package:almeyar/features/auth/data/repositories/auth_repo.dart';
import 'package:almeyar/features/auth/data/models/send_otp_request.dart';
import 'package:almeyar/features/auth/data/models/verify_otp_request.dart';
import 'package:almeyar/core/models/message_model.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthDataSource _dataSource;

  const AuthRepoImpl(this._dataSource);

  @override
  Future<Result<LoginResponse>> login(LoginRequest request) async {
    try {
      final response = await _dataSource.login(request);
      AppLogger.info('AuthRepoImpl - login: Successfully logged in');
      return Result.success(response);
    } catch (e, stackTrace) {
      AppLogger.error('AuthRepoImpl - login: Failed to login', e, stackTrace);
      return Result.failure(e, stackTrace);
    }
  }

  @override
  Future<Result<MessageModel>> sendOtp(SendOtpRequest request) async {
    try {
      final response = await _dataSource.sendOtp(request);
      AppLogger.info('AuthRepoImpl - sendOtp: Success');
      return Result.success(response);
    } catch (e, stackTrace) {
      AppLogger.error('AuthRepoImpl - sendOtp: Error', e, stackTrace);
      return Result.failure(e, stackTrace);
    }
  }

  @override
  Future<Result<MessageModel>> verifyOtp(VerifyOtpRequest request) async {
    try {
      final response = await _dataSource.verifyOtp(request);
      AppLogger.info('AuthRepoImpl - verifyOtp: Success');
      return Result.success(response);
    } catch (e, stackTrace) {
      AppLogger.error('AuthRepoImpl - verifyOtp: Error', e, stackTrace);
      return Result.failure(e, stackTrace);
    }
  }
}
