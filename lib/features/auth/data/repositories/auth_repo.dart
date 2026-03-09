import 'package:almeyar/core/network/result.dart';
import 'package:almeyar/features/auth/data/models/login_request.dart';
import 'package:almeyar/features/auth/data/models/login_response.dart';

abstract class AuthRepo {
  Future<Result<LoginResponse>> login(LoginRequest request);
}
