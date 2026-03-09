import 'package:almeyar/features/auth/data/api_service/auth_api_service.dart';
import 'package:almeyar/features/auth/data/datasources/auth_datasource.dart';
import 'package:almeyar/features/auth/data/models/login_request.dart';
import 'package:almeyar/features/auth/data/models/login_response.dart';

class AuthDataSourceImpl implements AuthDataSource {
  final AuthApiService _apiService;

  const AuthDataSourceImpl(this._apiService);

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    return await _apiService.login(request);
  }
}
