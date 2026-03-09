import 'package:almeyar/core/network/result.dart';
import 'package:almeyar/core/utils/app_logger.dart';
import 'package:almeyar/features/auth/data/datasources/auth_datasource.dart';
import 'package:almeyar/features/auth/data/models/login_request.dart';
import 'package:almeyar/features/auth/data/models/login_response.dart';
import 'package:almeyar/features/auth/data/repositories/auth_repo.dart';

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
}
