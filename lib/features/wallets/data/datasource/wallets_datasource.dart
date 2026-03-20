import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/models/message_model.dart';
import 'package:almeyar/features/wallets/data/models/deposits_response_model.dart';
import 'package:almeyar/features/wallets/data/models/deposit_metadata_model.dart';
import 'package:almeyar/features/wallets/data/models/transfer_request_model.dart';
import 'package:almeyar/features/wallets/data/models/wallet_model.dart';
import 'package:almeyar/features/wallets/data/models/wallet_transaction_model.dart';
import 'dart:io';

abstract class WalletsDataSource {
  Future<BaseResponse<List<WalletModel>>> getMyWallets();

  Future<BaseResponse<List<WalletTransactionModel>>> getWalletTransactions({
    required int id,
    int? type,
    String? from,
    String? to,
  });

  Future<BaseResponse<DepositsResponseModel>> getDeposits({int? page});

  Future<BaseResponse<MessageModel>> transfer(TransferRequestModel request);

  Future<BaseResponse<MessageModel>> sendOtp();

  Future<BaseResponse<void>> addDeposit({
    required String amount,
    required String currencyId,
    required String transferTypeId,
    required File attachment,
  });

  Future<BaseResponse<DepositMetadataModel>> getDepositMetadata();
}
