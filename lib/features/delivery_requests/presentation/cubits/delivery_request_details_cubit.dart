part of '../feature_imports.dart';

class DeliveryRequestDetailsCubit extends Cubit<DeliveryRequestDetailsState> {
  final DeliveryRequestsRepo _deliveryRequestsRepo;
  final InternetService _internetService;

  DeliveryRequestDetailsCubit(this._deliveryRequestsRepo, this._internetService)
    : super(const DeliveryRequestDetailsState());

  Future<void> getDeliveryRequestDetails(int orderId) async {
    emit(state.copyWith(getDeliveryRequestDetailsState: const AsyncLoading()));

    if (!await _internetService.isConnected()) {
      emit(
        state.copyWith(
          getDeliveryRequestDetailsState: AsyncError(
            ApiErrorModel(
              error: 'no_internet',
              status: LocalStatusCodes.connectionError,
            ),
          ),
        ),
      );
      return;
    }

    final result = await _deliveryRequestsRepo.getDeliveryRequestDetails(
      orderId: orderId,
    );

    result.when(
      onSuccess:
          (data) =>
              emit(state.copyWith(getDeliveryRequestDetailsState: AsyncData(data))),
      onFailure:
          (error) =>
              emit(state.copyWith(getDeliveryRequestDetailsState: AsyncError(error))),
    );
  }
}
