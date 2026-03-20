import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/models/message_model.dart';
import 'package:almeyar/core/utils/app_logger.dart';
import 'package:almeyar/core/network/result.dart';
import 'package:almeyar/features/money_transfers/data/models/money_transfer_currency_model.dart';
import 'package:almeyar/features/wallets/data/datasource/wallets_datasource.dart';
import 'package:almeyar/features/wallets/data/models/deposits_response_model.dart';
import 'package:almeyar/features/wallets/data/models/deposit_metadata_model.dart';
import 'package:almeyar/features/wallets/data/models/transfer_request_model.dart';
import 'package:almeyar/features/wallets/data/models/wallet_model.dart';
import 'package:almeyar/features/wallets/data/models/wallet_transaction_model.dart';
import 'wallets_repo.dart';
import 'dart:io';

class WalletsRepoImpl implements WalletsRepo {
  final WalletsDataSource _dataSource;

  const WalletsRepoImpl(this._dataSource);

  @override
  Future<Result<BaseResponse<List<WalletModel>>>> getMyWallets() async {
    try {
      final response = await _dataSource.getMyWallets();
      AppLogger.info('WalletsRepoImpl - getMyWallets: Success');
      return Result.success(response);
    } catch (e, st) {
      AppLogger.error('WalletsRepoImpl - getMyWallets: Error', e, st);
      return Result.failure(e, st);
    }
  }

  @override
  Future<Result<BaseResponse<List<WalletTransactionModel>>>>
  getWalletTransactions({
    required int id,
    int? type,
    String? from,
    String? to,
  }) async {
    try {
      final response = await _dataSource.getWalletTransactions(
        id: id,
        type: type,
        from: from,
        to: to,
      );
      AppLogger.info('WalletsRepoImpl - getWalletTransactions: Success');
      return Result.success(response);
    } catch (e, st) {
      AppLogger.error('WalletsRepoImpl - getWalletTransactions: Error', e, st);
      return Result.failure(e, st);
    }
  }

  @override
  Future<Result<BaseResponse<DepositsResponseModel>>> getDeposits({
    int? page,
  }) async {
    try {
      final response = await _dataSource.getDeposits(page: page);
      AppLogger.info('WalletsRepoImpl - getDeposits: Success');
      return Result.success(response);
    } catch (e, st) {
      AppLogger.error('WalletsRepoImpl - getDeposits: Error', e, st);
      return Result.failure(e, st);
    }
  }

  @override
  Future<Result<BaseResponse<MessageModel>>> transfer(
    TransferRequestModel request,
  ) async {
    try {
      final response = await _dataSource.transfer(request);
      AppLogger.info('WalletsRepoImpl - transfer: Success');
      return Result.success(response);
    } catch (e, st) {
      AppLogger.error('WalletsRepoImpl - transfer: Error', e, st);
      return Result.failure(e, st);
    }
  }

  @override
  Future<Result<BaseResponse<MessageModel>>> sendOtp() async {
    try {
      final response = await _dataSource.sendOtp();
      AppLogger.info('WalletsRepoImpl - sendOtp: Success');
      return Result.success(response);
    } catch (e, st) {
      AppLogger.error('WalletsRepoImpl - sendOtp: Error', e, st);
      return Result.failure(e, st);
    }
  }

  @override
  Future<Result<BaseResponse<void>>> addDeposit({
    required String amount,
    required String currencyId,
    required String transferTypeId,
    required File attachment,
  }) async {
    try {
      final response = await _dataSource.addDeposit(
        amount: amount,
        currencyId: currencyId,
        transferTypeId: transferTypeId,
        attachment: attachment,
      );
      AppLogger.info('WalletsRepoImpl - addDeposit: Success');
      return Result.success(response);
    } catch (e, st) {
      AppLogger.error('WalletsRepoImpl - addDeposit: Error', e, st);
      return Result.failure(e, st);
    }
  }

  @override
  Future<Result<BaseResponse<DepositMetadataModel>>>
  getDepositMetadata() async {
    try {
      final response = await _dataSource.getDepositMetadata();
      AppLogger.info('WalletsRepoImpl - getDepositMetadata: Success');
      return Result.success(response);
    } catch (e, st) {
      AppLogger.error('WalletsRepoImpl - getDepositMetadata: Error', e, st);
      return Result.failure(e, st);
    }
  }

  @override
  Future<Result<BaseResponse<List<MoneyTransferCurrencyModel>>>>
  getMoneyTransferCurrencies() async {
    try {
      final response = await _dataSource.getMoneyTransferCurrencies();
      AppLogger.info('WalletsRepoImpl - getMoneyTransferCurrencies: Success');
      return Result.success(response);
    } catch (e, st) {
      AppLogger.error(
        'WalletsRepoImpl - getMoneyTransferCurrencies: Error',
        e,
        st,
      );
      return Result.failure(e, st);
    }
  }
}
