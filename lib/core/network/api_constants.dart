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
  static const String allShipments = 'user/all-shipments';
  static const String shipmentStatusCounts = 'user/shipment-status-counts';

  // Profile
  static const String giftCards = 'user/gift-cards';
  static const String profile = 'user/profile';
  static const String updateProfile = 'user/auth/update-profile';
  static const String deleteAccount = 'user/auth/delete-account';
  static const String logout = 'user/auth/logout';
  static const String updatePassword = 'user/auth/update-password';
  static const String privacyPolicy = 'user/privacy-policy';
  static const String aboutApp = 'user/about-app';
  static const String termsAndConditions = 'user/terms-and-conditions';

  // Purchase Orders
  static const String purchaseRequests = 'user/my-purchase-requests';
  static const String addPurchaseRequest = 'user/add-purchase-request';
  static const String myWallets = 'user/my-wallets';
  static const String shoppingSites = 'user/shopping-sites';

  // Money Transfers
  static const String moneyTransfers = 'user/money-transfers';
  static const String addMoneyTransfer = 'user/add-money-transfer';
  static const String moneyTransferCurrencies = 'user/currencies';
  static const String deliveryRequestsOrders = 'user/delivery-requests-orders';
  static const String deliveryRequestsDetails =
      'user/delivery-requests-details';

  // Tickets
  static const String allTickets = 'user/tickets/all-tickets';
  static const String createTicket = 'user/tickets/create';
  static const String showTicket = 'user/tickets/show';
  static const String replyTicket = 'user/tickets/reply';
  static const String ticketReplies = 'user/tickets/replies';
}

