import 'dart:io';

import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/models/message_model.dart';

import '../models/money_transfer_model.dart';

abstract class MoneyTransfersDataSource {
  Future<BaseResponse<MoneyTransferResponse>> getMoneyTransfers({
    int? status,
    int? page,
  });

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
  });
}
