import 'package:almeyar/features/auth/data/models/login_request.dart';
import 'package:almeyar/features/auth/data/models/login_response.dart';

abstract class AuthDataSource {
  Future<LoginResponse> login(LoginRequest request);
}
