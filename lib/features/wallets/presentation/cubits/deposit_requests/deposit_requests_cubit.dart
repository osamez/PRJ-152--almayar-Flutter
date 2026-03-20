import 'dart:io';

import 'package:almeyar/core/models/base_response.dart';
import 'package:almeyar/core/network/api_error_model.dart';
import 'package:almeyar/core/network/local_status_codes.dart';
import 'package:almeyar/core/network/result.dart';
import 'package:almeyar/core/services/internet_service.dart';
import 'package:almeyar/core/utils/async.dart';
import 'package:almeyar/core/utils/result_extensions.dart';
import 'package:almeyar/features/money_transfers/data/models/money_transfer_currency_model.dart';
import 'package:almeyar/features/wallets/data/models/deposit_metadata_model.dart';
import 'package:almeyar/features/wallets/data/models/deposit_model.dart';
import 'package:almeyar/features/wallets/data/models/deposits_response_model.dart';
import 'package:almeyar/features/wallets/data/repos/wallets_repo.dart';
import 'package:almeyar/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'deposit_requests_state.dart';

class DepositRequestsCubit extends Cubit<DepositRequestsState> {
  final WalletsRepo _repo;
  final InternetService _internetService;

  DepositRequestsCubit(this._repo, this._internetService)
    : super(const DepositRequestsState());

  Future<void> loadInitialData() async {
    emit(
      state.copyWith(
        getDepositsState: const AsyncLoading(),
        getMoneyTransferCurrenciesState: const AsyncLoading(),
        getDepositMetadataState: const AsyncLoading(),
        depositsList: const <DepositModel>[],
        depositsPage: 1,
        depositsHasMore: true,
        isDepositsPaginationLoading: false,
      ),
    );

    if (!await _internetService.isConnected()) {
      final error = ApiErrorModel(
        error: LocaleKeys.no_internet_error.tr(),
        status: LocalStatusCodes.connectionError,
      );
      emit(
        state.copyWith(
          getDepositsState: AsyncError(error),
          getMoneyTransferCurrenciesState: AsyncError(error),
          getDepositMetadataState: AsyncError(error),
          depositsList: const <DepositModel>[],
          depositsPage: 1,
          depositsHasMore: false,
          isDepositsPaginationLoading: false,
        ),
      );
      return;
    }

    final results = await Future.wait([
      _repo.getDeposits(page: 1),
      _repo.getMoneyTransferCurrencies(),
      _repo.getDepositMetadata(),
    ]);

    final depositsResult =
        results[0] as Result<BaseResponse<DepositsResponseModel>>;
    final currenciesResult =
        results[1] as Result<BaseResponse<List<MoneyTransferCurrencyModel>>>;
    final metadataResult =
        results[2] as Result<BaseResponse<DepositMetadataModel>>;

    final depositsAsync = depositsResult.toAsyncUnwrapped();
    final depositsData = depositsAsync.valueOrNull;
    final meta = depositsData?.meta;
    final depositsList = depositsData?.deposits ?? const <DepositModel>[];
    final currentPage = meta?.currentPage ?? 1;
    final lastPage = meta?.lastPage;
    final hasMore = lastPage != null
        ? (currentPage < lastPage)
        : depositsList.isNotEmpty;

    emit(
      state.copyWith(
        getDepositsState: depositsAsync,
        depositsList: depositsList,
        depositsPage: currentPage,
        depositsHasMore: hasMore,
        isDepositsPaginationLoading: false,
        getMoneyTransferCurrenciesState: currenciesResult.toAsyncUnwrapped(),
        getDepositMetadataState: metadataResult.toAsyncUnwrapped(),
      ),
    );
  }

  Future<void> getDeposits({int page = 1}) async {
    emit(
      state.copyWith(
        getDepositsState: const AsyncLoading(),
        depositsList: const <DepositModel>[],
        depositsPage: 1,
        depositsHasMore: true,
        isDepositsPaginationLoading: false,
      ),
    );

    if (!await _internetService.isConnected()) {
      emit(
        state.copyWith(
          getDepositsState: AsyncError(
            ApiErrorModel(
              error: LocaleKeys.no_internet_error.tr(),
              status: LocalStatusCodes.connectionError,
            ),
          ),
          depositsList: const <DepositModel>[],
          depositsPage: 1,
          depositsHasMore: false,
          isDepositsPaginationLoading: false,
        ),
      );
      return;
    }

    final result = await _repo.getDeposits(page: page);
    final asyncValue = result.toAsyncUnwrapped();
    final data = asyncValue.valueOrNull;
    final meta = data?.meta;
    final depositsList = data?.deposits ?? const <DepositModel>[];
    final currentPage = meta?.currentPage ?? page;
    final lastPage = meta?.lastPage;
    final hasMore = lastPage != null
        ? (currentPage < lastPage)
        : depositsList.isNotEmpty;

    emit(
      state.copyWith(
        getDepositsState: asyncValue,
        depositsList: depositsList,
        depositsPage: currentPage,
        depositsHasMore: hasMore,
        isDepositsPaginationLoading: false,
      ),
    );
  }

  Future<void> loadMoreDeposits() async {
    if (state.getDepositsState.isLoading ||
        state.isDepositsPaginationLoading ||
        !state.depositsHasMore) {
      return;
    }

    emit(state.copyWith(isDepositsPaginationLoading: true));

    if (!await _internetService.isConnected()) {
      emit(state.copyWith(isDepositsPaginationLoading: false));
      return;
    }

    final nextPage = state.depositsPage + 1;
    final result = await _repo.getDeposits(page: nextPage);

    result.when(
      onSuccess: (response) {
        final data = response.data;
        final meta = data?.meta;
        final newItems = data?.deposits ?? const <DepositModel>[];
        final updated = [...state.depositsList, ...newItems];
        final currentPage = meta?.currentPage ?? nextPage;
        final lastPage = meta?.lastPage;
        final hasMore = lastPage != null
            ? (currentPage < lastPage)
            : newItems.isNotEmpty;

        emit(
          state.copyWith(
            depositsList: updated,
            depositsPage: currentPage,
            depositsHasMore: hasMore,
            isDepositsPaginationLoading: false,
          ),
        );
      },
      onFailure: (_) {
        emit(state.copyWith(isDepositsPaginationLoading: false));
      },
    );
  }

  void selectCurrency(CurrencyModel? currency) {
    emit(state.copyWith(selectedCurrency: () => currency));
  }

  void selectTransferType(TransferTypeModel? transferType) {
    emit(state.copyWith(selectedTransferType: () => transferType));
  }

  Future<void> pickFiles() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.any,
    );

    if (result == null) return;

    final newFiles = result.paths
        .whereType<String>()
        .map((path) => File(path))
        .toList();

    if (newFiles.isEmpty) return;

    emit(state.copyWith(selectedFiles: [...state.selectedFiles, ...newFiles]));
  }

  void removeFile(int index) {
    final updatedFiles = List<File>.from(state.selectedFiles);
    if (index < 0 || index >= updatedFiles.length) return;
    updatedFiles.removeAt(index);
    emit(state.copyWith(selectedFiles: updatedFiles));
  }

  void clearAddDepositForm() {
    emit(
      state.copyWith(
        selectedCurrency: () => null,
        selectedTransferType: () => null,
        selectedFiles: const [],
      ),
    );
  }

  Future<void> addDeposit({required String amount}) async {
    if (state.selectedCurrency == null ||
        state.selectedTransferType == null ||
        state.selectedFiles.isEmpty) {
      return;
    }

    emit(state.copyWith(addDepositState: const AsyncLoading()));

    if (!await _internetService.isConnected()) {
      emit(
        state.copyWith(
          addDepositState: AsyncError(
            ApiErrorModel(
              error: LocaleKeys.no_internet_error.tr(),
              status: LocalStatusCodes.connectionError,
            ),
          ),
        ),
      );
      return;
    }

    final result = await _repo.addDeposit(
      amount: amount,
      currencyId: state.selectedCurrency!.id.toString(),
      transferTypeId: state.selectedTransferType!.id.toString(),
      attachment: state.selectedFiles.first,
    );

    result.when(
      onSuccess: (response) {
        emit(
          state.copyWith(addDepositState: AsyncData(response.message ?? '')),
        );
      },
      onFailure: (error) {
        emit(state.copyWith(addDepositState: AsyncError(error)));
      },
    );
  }
}
