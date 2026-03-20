import 'package:almeyar/core/network/api_constants.dart';
import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/models/message_model.dart';
import 'package:almeyar/features/wallets/data/models/deposits_response_model.dart';
import 'package:almeyar/features/wallets/data/models/deposit_metadata_model.dart';
import 'package:almeyar/features/wallets/data/models/transfer_request_model.dart';
import 'package:almeyar/features/wallets/data/models/wallet_model.dart';
import 'package:almeyar/features/wallets/data/models/wallet_transaction_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'dart:io';

part 'wallets_api_service.g.dart';

@RestApi()
abstract class WalletsApiService {
  factory WalletsApiService(Dio dio, {String baseUrl}) = _WalletsApiService;

  @GET(ApiConstants.myWallets)
  Future<BaseResponse<List<WalletModel>>> getMyWallets();

  @GET(ApiConstants.walletTransactions)
  Future<BaseResponse<List<WalletTransactionModel>>> getWalletTransactions(
    @Path('id') int id,
    @Query('type') int? type,
    @Query('from') String? from,
    @Query('to') String? to,
  );

  @GET(ApiConstants.deposits)
  Future<BaseResponse<DepositsResponseModel>> getDeposits(
    @Query('page') int? page,
  );

  @POST(ApiConstants.walletTransfer)
  Future<BaseResponse<MessageModel>> transfer(
    @Body() TransferRequestModel request,
  );

  @POST(ApiConstants.walletSendOtp)
  Future<BaseResponse<MessageModel>> sendOtp();

  @POST(ApiConstants.addDeposit)
  @MultiPart()
  Future<BaseResponse<void>> addDeposit({
    @Part() required String amount,
    @Part(name: 'currency_id') required String currencyId,
    @Part(name: 'transfer_type_id') required String transferTypeId,
    @Part() required File attachment,
  });

  @GET(ApiConstants.depositMetadata)
  Future<BaseResponse<DepositMetadataModel>> getDepositMetadata();
}
