import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/models/message_model.dart';
import 'package:almeyar/features/money_transfers/data/models/money_transfer_currency_model.dart';
import 'package:almeyar/features/wallets/data/api_service/wallets_api_service.dart';
import 'package:almeyar/features/wallets/data/models/deposits_response_model.dart';
import 'package:almeyar/features/wallets/data/models/deposit_metadata_model.dart';
import 'package:almeyar/features/wallets/data/models/transfer_request_model.dart';
import 'package:almeyar/features/wallets/data/models/wallet_model.dart';
import 'package:almeyar/features/wallets/data/models/wallet_transaction_model.dart';
import 'wallets_datasource.dart';
import 'dart:io';

class WalletsDataSourceImpl implements WalletsDataSource {
  final WalletsApiService _apiService;

  const WalletsDataSourceImpl(this._apiService);

  @override
  Future<BaseResponse<List<WalletModel>>> getMyWallets() async {
    return await _apiService.getMyWallets();
  }

  @override
  Future<BaseResponse<List<WalletTransactionModel>>> getWalletTransactions({
    required int id,
    int? type,
    String? from,
    String? to,
  }) async {
    return await _apiService.getWalletTransactions(id, type, from, to);
  }

  @override
  Future<BaseResponse<DepositsResponseModel>> getDeposits({int? page}) async {
    return await _apiService.getDeposits(page);
  }

  @override
  Future<BaseResponse<MessageModel>> transfer(
    TransferRequestModel request,
  ) async {
    return await _apiService.transfer(request);
  }

  @override
  Future<BaseResponse<MessageModel>> sendOtp() async {
    return await _apiService.sendOtp();
  }

  @override
  Future<BaseResponse<void>> addDeposit({
    required String amount,
    required String currencyId,
    required String transferTypeId,
    required File attachment,
  }) async {
    return await _apiService.addDeposit(
      amount: amount,
      currencyId: currencyId,
      transferTypeId: transferTypeId,
      attachment: attachment,
    );
  }

  @override
  Future<BaseResponse<DepositMetadataModel>> getDepositMetadata() async {
    return await _apiService.getDepositMetadata();
  }

  @override
  Future<BaseResponse<List<MoneyTransferCurrencyModel>>>
  getMoneyTransferCurrencies() async {
    return await _apiService.getMoneyTransferCurrencies();
  }
}
