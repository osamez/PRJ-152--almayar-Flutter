import 'dart:io';

import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/models/message_model.dart';
import 'package:almeyar/core/network/result.dart';

import '../models/money_transfer_currency_model.dart';
import '../models/money_transfer_model.dart';
import '../models/note_calculate_model.dart';
import '../models/note_calculate_request.dart';

abstract class MoneyTransfersRepo {
  Future<Result<BaseResponse<MoneyTransferResponse>>> getMoneyTransfers({
    int? status,
    int? page,
  });

  Future<Result<BaseResponse<List<MoneyTransferCurrencyModel>>>>
  getMoneyTransferCurrencies();

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
  });

  Future<Result<BaseResponse<NoteCalculateModel>>> noteCalculateMoneyTransfer(
    NoteCalculateRequest request,
  );
}
