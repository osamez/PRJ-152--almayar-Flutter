import 'package:almeyar/core/network/result.dart';
import 'package:almeyar/core/models/base_response.dart';
import 'dart:io';
import 'package:almeyar/core/models/message_model.dart';
import 'package:almeyar/features/wallets/data/models/deposits_response_model.dart';
import 'package:almeyar/features/wallets/data/models/deposit_metadata_model.dart';
import 'package:almeyar/features/wallets/data/models/transfer_request_model.dart';
import 'package:almeyar/features/wallets/data/models/wallet_model.dart';
import 'package:almeyar/features/wallets/data/models/wallet_transaction_model.dart';

abstract class WalletsRepo {
  Future<Result<BaseResponse<List<WalletModel>>>> getMyWallets();

  Future<Result<BaseResponse<List<WalletTransactionModel>>>> getWalletTransactions({
    required int id,
    int? type,
    String? from,
    String? to,
  });

  Future<Result<BaseResponse<DepositsResponseModel>>> getDeposits({int? page});

  Future<Result<BaseResponse<MessageModel>>> transfer(
    TransferRequestModel request,
  );

  Future<Result<BaseResponse<MessageModel>>> sendOtp();

  Future<Result<BaseResponse<void>>> addDeposit({
    required String amount,
    required String currencyId,
    required String transferTypeId,
    required File attachment,
  });

  Future<Result<BaseResponse<DepositMetadataModel>>> getDepositMetadata();
}
