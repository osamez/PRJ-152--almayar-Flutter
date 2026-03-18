import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/network/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/money_transfer_model.dart';

part 'money_transfers_api_service.g.dart';

@RestApi()
abstract class MoneyTransfersApiService {
  factory MoneyTransfersApiService(Dio dio, {String baseUrl}) =
      _MoneyTransfersApiService;

  @GET(ApiConstants.moneyTransfers)
  Future<BaseResponse<MoneyTransferResponse>> getMoneyTransfers({
    @Query('status') int? status,
    @Query('page') int? page,
  });
}
