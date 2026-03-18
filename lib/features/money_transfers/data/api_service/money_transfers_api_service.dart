import 'dart:io';

import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/models/message_model.dart';
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

  @POST(ApiConstants.addMoneyTransfer)
  @MultiPart()
  Future<MessageModel> addMoneyTransfer({
    @Part(name: 'invoice_images') File? invoiceImages,
    @Part(name: 'invoice_value') String? invoiceValue,
    @Part(name: 'payment_currency_id') String? paymentCurrencyId,
    @Part(name: 'currency_id') String? currencyId,
    @Part(name: 'supplier_name') String? supplierName,
    @Part(name: 'supplier_address') String? supplierAddress,
    @Part(name: 'supplier_phone_code') String? supplierPhoneCode,
    @Part(name: 'supplier_phone') String? supplierPhone,
    @Part(name: 'notes') String? notes,
  });
}
