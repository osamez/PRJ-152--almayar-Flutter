class ApiConstants {
  const ApiConstants._();

  // Auth
  static const String login = 'user/auth/login';
  static const String register = 'user/auth/register';
  static const String sendOtp = 'user/auth/send-otp';
  static const String verifyOtp = 'user/auth/verify-otp';
  static const String forgotPassword = 'user/auth/forgot-password';
  static const String receivingBranches = 'user/receiving-branches';
  static const String deliveryBranches = 'user/delivery-branches';
  static const String countryLocations = 'user/auth/country-locations';
  static const String prohibitedSea = 'user/prohibited-sea';
  static const String prohibitedAir = 'user/prohibited-air';
  static const String allBranches = 'user/all-branches';
  static const String showBranch = 'user/show-branch/{id}';
  static const String shipmentRequests = 'user/my-shipment-requests';
  static const String shipmentContents = 'user/shipment-contents';
  static const String shipmentCategories = 'user/shipment-categories';
  static const String addShipmentRequest = 'user/add-shipment-request';

  // Price Calculator
  static const String calculateShipmentPrice = 'user/calculate-shipment-price';
}
