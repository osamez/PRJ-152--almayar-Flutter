part of '../feature_imports.dart';

class DeliveryRequestDetailsState extends Equatable {
  final Async<DeliveryOrderDetailsModel> getDeliveryRequestDetailsState;

  const DeliveryRequestDetailsState({
    this.getDeliveryRequestDetailsState = const AsyncInitial(),
  });

  DeliveryRequestDetailsState copyWith({
    Async<DeliveryOrderDetailsModel>? getDeliveryRequestDetailsState,
  }) {
    return DeliveryRequestDetailsState(
      getDeliveryRequestDetailsState:
          getDeliveryRequestDetailsState ?? this.getDeliveryRequestDetailsState,
    );
  }

  @override
  List<Object?> get props => [getDeliveryRequestDetailsState];
}
