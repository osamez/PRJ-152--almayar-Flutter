import 'dart:io';

import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/models/message_model.dart';

import '../api_service/money_transfers_api_service.dart';
import '../models/money_transfer_currency_model.dart';
import '../models/money_transfer_model.dart';
import 'money_transfers_datasource.dart';

class MoneyTransfersDataSourceImpl implements MoneyTransfersDataSource {
  final MoneyTransfersApiService _apiService;

  const MoneyTransfersDataSourceImpl(this._apiService);

  @override
  Future<BaseResponse<MoneyTransferResponse>> getMoneyTransfers({
    int? status,
    int? page,
  }) async {
    return await _apiService.getMoneyTransfers(status: status, page: page);
  }

  @override
  Future<BaseResponse<List<MoneyTransferCurrencyModel>>>
  getMoneyTransferCurrencies() async {
    return await _apiService.getMoneyTransferCurrencies();
  }

  @override
  Future<MessageModel> addMoneyTransfer({
    File? invoiceImages,
    String? invoiceValue,
    String? paymentCurrencyId,
    String? currencyId,
    String? supplierName,
    String? supplierAddress,
    String? supplierPhoneCode,
    String? supplierPhone,
    String? notes,
  }) async {
    return await _apiService.addMoneyTransfer(
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
  }
}
