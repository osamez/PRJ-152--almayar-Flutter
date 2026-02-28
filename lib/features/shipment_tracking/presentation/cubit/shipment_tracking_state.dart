part of 'shipment_tracking_cubit.dart';

class ShipmentTrackingState extends Equatable {
  final int selectedTabIndex;

  const ShipmentTrackingState({this.selectedTabIndex = 0});

  ShipmentTrackingState copyWith({int? selectedTabIndex}) {
    return ShipmentTrackingState(
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
    );
  }

  @override
  List<Object> get props => [selectedTabIndex];
}
