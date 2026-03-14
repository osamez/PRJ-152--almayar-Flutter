class ApiConstants {
  const ApiConstants._();

  // Auth
  static const String login = 'user/auth/login';
  static const String register = 'user/auth/register';
  static const String sendOtp = 'user/auth/send-otp';
  static const String verifyOtp = 'user/auth/verify-otp';
  static const String forgotPassword = 'user/auth/forgot-password';
  static const String receivingBranches = 'user/receiving-branches';
  static const String countryLocations = 'user/auth/country-locations';
  static const String prohibitedSea = 'user/prohibited-sea';
  static const String prohibitedAir = 'user/prohibited-air';
  static const String allBranches = 'user/all-branches';
  static const String showBranch = 'user/show-branch/{id}';
}
