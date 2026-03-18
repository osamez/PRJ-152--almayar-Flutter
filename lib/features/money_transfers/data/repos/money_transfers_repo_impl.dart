import 'dart:io';

import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/models/message_model.dart';
import 'package:almeyar/core/network/result.dart';
import 'package:almeyar/core/utils/app_logger.dart';

import '../datasource/money_transfers_datasource.dart';
import '../models/money_transfer_currency_model.dart';
import '../models/money_transfer_model.dart';
import 'money_transfers_repo.dart';

class MoneyTransfersRepoImpl implements MoneyTransfersRepo {
  final MoneyTransfersDataSource _dataSource;

  const MoneyTransfersRepoImpl(this._dataSource);

  @override
  Future<Result<BaseResponse<MoneyTransferResponse>>> getMoneyTransfers({
    int? status,
    int? page,
  }) async {
    try {
      final response = await _dataSource.getMoneyTransfers(
        status: status,
        page: page,
      );
      AppLogger.info('MoneyTransfersRepoImpl - getMoneyTransfers: Success');
      return Result.success(response);
    } catch (e, stackTrace) {
      AppLogger.error(
        'MoneyTransfersRepoImpl - getMoneyTransfers: Error',
        e,
        stackTrace,
      );
      return Result.failure(e, stackTrace);
    }
  }

  @override
  Future<Result<BaseResponse<List<MoneyTransferCurrencyModel>>>>
  getMoneyTransferCurrencies() async {
    try {
      final response = await _dataSource.getMoneyTransferCurrencies();
      AppLogger.info(
        'MoneyTransfersRepoImpl - getMoneyTransferCurrencies: Success',
      );
      return Result.success(response);
    } catch (e, stackTrace) {
      AppLogger.error(
        'MoneyTransfersRepoImpl - getMoneyTransferCurrencies: Error',
        e,
        stackTrace,
      );
      return Result.failure(e, stackTrace);
    }
  }

  @override
  Future<Result<MessageModel>> addMoneyTransfer({
    List<File>? invoiceImages,
    String? invoiceValue,
    String? paymentCurrencyId,
    String? currencyId,
    String? supplierName,
    String? supplierAddress,
    String? supplierPhoneCode,
    String? supplierPhone,
    String? notes,
  }) async {
    try {
      final response = await _dataSource.addMoneyTransfer(
        invoiceImages: invoiceImages,
        invoiceValue: invoiceValue,
        paymentCurrencyId: paymentCurrencyId,
        currencyId: currencyId,
        supplierName: supplierName,
        supplierAddress: supplierAddress,
        supplierPhoneCode: supplierPhoneCode,
        supplierPhone: supplierPhone,
        notes: notes,
      );
      AppLogger.info('MoneyTransfersRepoImpl - addMoneyTransfer: Success');
      return Result.success(response);
    } catch (e, stackTrace) {
      AppLogger.error(
        'MoneyTransfersRepoImpl - addMoneyTransfer: Error',
        e,
        stackTrace,
      );
      return Result.failure(e, stackTrace);
    }
  }
}
