class ApiErrorModel {
  final String error;
  final int? status;
  final String? message;
  ApiErrorModel({required this.error, this.status, this.message});
}
