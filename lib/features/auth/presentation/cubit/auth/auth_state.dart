part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final Async<LoginResponse> loginState;

  const AuthState({this.loginState = const AsyncInitial()});

  AuthState copyWith({Async<LoginResponse>? loginState}) {
    return AuthState(loginState: loginState ?? this.loginState);
  }

  @override
  List<Object?> get props => [loginState];
}
